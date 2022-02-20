from flask import Flask, render_template, request, flash, json, jsonify
import mysql.connector

app = Flask(__name__)
app.secret_key="***"

config = {
    'user': 'root',
    'password': '***',
    'host': '127.0.0.1',
    'database': 'summer_camp',
    'raise_on_warnings': True
}

LOGGED_IN_CAMPER = 1

cnx = mysql.connector.connect(**config)
cursor = cnx.cursor(buffered=True)

@app.route("/")
def home():
    return render_template("home.html")


@app.route("/dashboard")
def dashboard():
    sql_count_campers = """ SELECT COUNT(application.application_id) 
                            FROM application 
                            INNER JOIN status 
                            ON application.status_id=status.status_id 
                            WHERE status.status_name='Accepted'; """

    cursor.execute(sql_count_campers)
    num_of_campers = cursor.fetchall()[0][0]

    sql_campers_by_div = """ SELECT division.`name`, COUNT(application.camper_id) 
                             FROM division INNER JOIN program 
                             ON program.division_id=division.division_id 
                             INNER JOIN application 
                             ON application.program_id=program.program_id 
                             INNER JOIN status 
                             ON application.status_id=status.status_id 
                             WHERE status.status_name='Accepted' 
                             GROUP BY (division.`name`) 
                             ORDER BY COUNT(application.camper_id) DESC; """

    cursor.execute(sql_campers_by_div)
    num_of_campers_by_div = cursor.fetchall()

    sql_campers_by_country = """ SELECT country.country_name, COUNT(camper.camper_id) 
                                 FROM country
                                 INNER JOIN city
                                 ON city.country_id=country.country_id
                                 INNER JOIN address
                                 ON address.city_id=city.city_id
                                 INNER JOIN camper
                                 ON camper.address_id=address.address_id
                                 INNER JOIN application
                                 ON camper.camper_id=application.camper_id
                                 INNER JOIN status
                                 ON application.status_id=status.status_id
                                 WHERE status.status_name='Accepted'
                                 GROUP BY country_name
                                 ORDER BY COUNT(camper.camper_id) DESC; """

    cursor.execute(sql_campers_by_country)
    num_of_campers_by_country = cursor.fetchall()

    origin_labels = [row[0] for row in num_of_campers_by_country]
    count_values = [row[1] for row in num_of_campers_by_country]

    sql_applications_by_year = """ SELECT YEAR(application.date), COUNT(application.camper_id)
                                   FROM application
                                   GROUP BY YEAR(application.date)
                                   ORDER BY COUNT(application.camper_id); """

    cursor.execute(sql_applications_by_year)
    num_of_applications_by_year = cursor.fetchall()

    num_of_applications_by_year.sort()

    year_labels = [row[0] for row in num_of_applications_by_year]
    appl_values = [row[1] for row in num_of_applications_by_year]

    sql_applications_by_country = """ SELECT country.country_name, COUNT(application.application_id)
                                      FROM country
                                      INNER JOIN city
                                      ON city.country_id=country.country_id
                                      INNER JOIN address
                                      ON address.city_id=city.city_id
                                      INNER JOIN camper
                                      ON camper.address_id=address.address_id
                                      INNER JOIN application
                                      ON camper.camper_id=application.camper_id
                                      GROUP BY country_name
                                      ORDER BY COUNT(application.application_id) DESC; """

    cursor.execute(sql_applications_by_country)
    num_of_applications_by_country = cursor.fetchall()

    origin_labels_appl = [row[0] for row in num_of_applications_by_country]
    count_values_appl = [row[1] for row in num_of_applications_by_country]

    sql_programs_by_session = """ SELECT session.session_name, COUNT(program.program_id), session.session_id 
                                  FROM session
                                  INNER JOIN program
                                  ON program.session_id=session.session_id
                                  GROUP BY (session_name)
                                  ORDER BY COUNT(program.program_id) DESC; """

    cursor.execute(sql_programs_by_session)
    num_of_programs_by_session = cursor.fetchall()
    num_of_programs_by_session.sort(reverse=True)

    sql_num_of_programs_by_div = """ SELECT division.name, COUNT(program_id) 
                                     FROM program
                                     INNER JOIN division
                                     ON program.division_id=division.division_id 
                                     GROUP BY (division.name); """

    cursor.execute(sql_num_of_programs_by_div)
    num_of_programms_by_div = cursor.fetchall()

    sql_total_applications = """ SELECT COUNT(application.application_id) 
                                 FROM application 
                                 INNER JOIN status
                                 ON application.status_id=status.status_id 
                                 WHERE status.status_name="Accepted" 
                                 OR status.status_name="Rejected"; """

    cursor.execute(sql_total_applications)
    total_applications = cursor.fetchall()

    sql_accepted_applications = """ SELECT COUNT(application.application_id) 
                                    FROM application
                                    INNER JOIN status
                                    ON application.status_id=status.status_id 
                                    WHERE status.status_name="Accepted"; """

    cursor.execute(sql_accepted_applications)
    accepted_applications = cursor.fetchall()

    sql_rejected_applications = """ SELECT COUNT(application.application_id) 
                                    FROM application
                                    INNER JOIN status
                                    ON application.status_id=status.status_id 
                                    WHERE status.status_name="Rejected"; """

    cursor.execute(sql_rejected_applications)
    rejected_applications = cursor.fetchall()

    total_applications = total_applications[0][0]
    accepted_applications = accepted_applications[0][0]
    rejected_applications = rejected_applications[0][0]

    print(year_labels)

    return render_template(
        "dashboard.html", 
        total_campers=num_of_campers, 
        campers_by_div=num_of_campers_by_div, 
        campers_by_country=num_of_campers_by_country, 
        applications_by_year=num_of_applications_by_year, 
        applications_by_country=num_of_applications_by_country, 
        programs_by_sessions=num_of_programs_by_session, 
        programs_by_divisions=num_of_programms_by_div, 
        total_applications=total_applications, 
        accepted_applications=accepted_applications, 
        rejected_applications=rejected_applications, 
        year_labels=year_labels, 
        appl_values=appl_values, 
        origin_labels=origin_labels, 
        count_values=count_values, 
        origin_labels_appl=origin_labels_appl, 
        count_values_appl=count_values_appl)


@app.route("/manage-applications", methods=['POST', 'GET'])
def manage_applications():

    LOGGED_IN_DIVISION_ID = 2

    sql_get_sessions = """ SELECT * FROM session; """
    cursor.execute(sql_get_sessions)
    sessions = cursor.fetchall()
    sessions.insert(0, (0, 'All'))

    sql_get_statuses = """ SELECT * FROM status; """
    cursor.execute(sql_get_statuses)
    statuses = cursor.fetchall()
    statuses.insert(0, (0, 'All'))

    sql_get_logged_in_div = """ SELECT name FROM division 
                                WHERE division_id={division_id}; """.format(division_id=LOGGED_IN_DIVISION_ID)

    cursor.execute(sql_get_logged_in_div)
    division_name = cursor.fetchall()[0][0]

    sql_get_applications = """ SELECT application.application_id, program.name, 
                               CONCAT_WS(' ', camper.first_name, camper.middle_name, camper.last_name) , 
                               application.date, status.status_name, application.date_of_decision
                               FROM application
                               INNER JOIN status
                               ON application.status_id=status.status_id
                               INNER JOIN camper
                               ON application.camper_id=camper.camper_id
                               INNER JOIN program
                               ON application.program_id=program.program_id
                               INNER JOIN session
                               ON program.session_id=session.session_id
                               WHERE program.division_id={division_id}; """.format(division_id=LOGGED_IN_DIVISION_ID)

    if request.method == "POST":
        req = request.form
        search_text = req['search_field']
        session_sort = req['session_dropdown']
        status_sort = req['status_dropdown']

        if session_sort == 0:
            session_name = 'All'
        else:
            sql_get_session_name = """ SELECT session_name 
                                       FROM session 
                                       WHERE session_id={sess_id}; """.format(sess_id=session_sort)

            cursor.execute(sql_get_session_name)
            session_name = cursor.fetchall()

        if status_sort == 0:
            status_name = 'All'
        else:
            sql_get_status_name = """ SELECT status_name 
                                      FROM status 
                                      WHERE status_id={status_id}; """.format(status_id=status_sort)

            cursor.execute(sql_get_status_name)
            status_name = cursor.fetchall()

        cursor.execute(sql_get_status_name)
        status_name = cursor.fetchall()

        print(session_sort)
        print(sessions[0][0], session_sort)
        print(int(session_sort) == 0)

        sql_get_applications_sort = """ SELECT application.application_id, program.name, 
                                        CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name), 
                                        application.date, status.status_name, application.date_of_decision
                                        FROM application
                                        INNER JOIN status
                                        ON application.status_id=status.status_id
                                        INNER JOIN camper
                                        ON application.camper_id=camper.camper_id
                                        INNER JOIN program
                                        ON application.program_id=program.program_id
                                        INNER JOIN session
                                        ON program.session_id=session.session_id
                                        WHERE program.division_id={division_id} 
                                        AND CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name) 
                                        LIKE '%{search_text}%' 
                                        AND session.session_id={sess_id} 
                                        AND status.status_id={stat_id};""".format(division_id=LOGGED_IN_DIVISION_ID, 
                                                                                    search_text=search_text, 
                                                                                    sess_id=session_sort, 
                                                                                    stat_id=status_sort)

        sql_session_status_all = """ SELECT application.application_id, program.name, 
                                     CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name), 
                                     application.date, status.status_name, application.date_of_decision
                                     FROM application
                                     INNER JOIN status
                                     ON application.status_id=status.status_id
                                     INNER JOIN camper
                                     ON application.camper_id=camper.camper_id
                                     INNER JOIN program
                                     ON application.program_id=program.program_id
                                     INNER JOIN session
                                     ON program.session_id=session.session_id
                                     WHERE program.division_id={division_id} 
                                     AND CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name) 
                                     LIKE '%{search_text}%';""".format(division_id=LOGGED_IN_DIVISION_ID, 
                                                                        search_text=search_text)

        sql_session_all = """ SELECT application.application_id, program.name, 
                              CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name), 
                              application.date, status.status_name, application.date_of_decision
                              FROM application
                              INNER JOIN status
                              ON application.status_id=status.status_id
                              INNER JOIN camper
                              ON application.camper_id=camper.camper_id
                              INNER JOIN program
                              ON application.program_id=program.program_id
                              INNER JOIN session
                              ON program.session_id=session.session_id
                              WHERE program.division_id={division_id} 
                              AND CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name) 
                              LIKE '%{search_text}%' 
                              AND status.status_id={stat_id};""".format(division_id=LOGGED_IN_DIVISION_ID, 
                                                                        search_text=search_text, 
                                                                        stat_id=status_sort)

        sql_status_all = """ SELECT application.application_id, program.name, 
                             CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name), 
                             application.date, status.status_name, application.date_of_decision
                             FROM application
                             INNER JOIN status
                             ON application.status_id=status.status_id
                             INNER JOIN camper
                             ON application.camper_id=camper.camper_id
                             INNER JOIN program
                             ON application.program_id=program.program_id
                             INNER JOIN session
                             ON program.session_id=session.session_id
                             WHERE program.division_id={division_id} 
                             AND CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name) 
                             LIKE '%{search_text}%' 
                             AND session.session_id={sess_id};""".format(division_id=LOGGED_IN_DIVISION_ID,
                                                                         search_text=search_text, 
                                                                         sess_id=session_sort)
        
        new_applications = []
        if (int(session_sort) == 0 and int(status_sort) == 0):
            cursor.execute(sql_session_status_all)
            new_applications = cursor.fetchall()
        elif (int(session_sort) == 0 and int(status_sort) != 0):
            cursor.execute(sql_session_all)
            new_applications = cursor.fetchall()
        elif (int(session_sort) != 0 and int(status_sort) == 0):
            cursor.execute(sql_status_all)
            new_applications = cursor.fetchall()
        else:
            cursor.execute(sql_get_applications_sort)
            new_applications = cursor.fetchall()

        print(search_text, session_sort, status_sort)
        print(new_applications)

        if (len(new_applications) < 1):
            flash("No applications found that match search criteria", 'info')

        return render_template(
            "manage-applications.html", 
            applications=new_applications, 
            sessions=sessions, 
            statuses=statuses, 
            session_name=session_name, 
            status_name=status_name, 
            search_text=search_text, 
            session_sort=int(session_sort), 
            status_sort=int(status_sort), 
            division_name=division_name)
    else:
        cursor.execute(sql_get_applications)
        applications = cursor.fetchall()

        return render_template(
            "manage-applications.html", 
            applications=applications, 
            sessions=sessions, 
            statuses=statuses, 
            division_name=division_name)


@app.route('/get_application', methods=['POST', 'GET'])
def get_application():
    print("Request for application is sent!")
    if request.method == 'POST':
        application_id = request.form['application_id']
        print("Requested application id:", application_id)

        sql_application = """
                    SELECT 
                    program.name, 
                    application.date, 
                    camper.first_name, 
                    camper.middle_name, 
                    camper.last_name, 
                    camper.date_of_birth, 
                    camper.gender, 
                    address.apartment_no, 
                    address.street_name, 
                    address.street_number, 
                    address.postal_code, 
                    city.city_name, 
                    country.country_name, 
                    camper.adr_same_as_guard, 
                    guardian.first_name, 
                    guardian.middle_name, 
                    guardian.last_name, 
                    guardian.gender, 
                    relation.relation_name, 
                    guardian.email_address, 
                    guardian.phone_number,
                    guardian.address_id, 
                    ga.apartment_no, 
                    ga.street_number, 
                    ga.street_name, 
                    ga.postal_code, 
                    gc.city_name, 
                    gcnt.country_name 
                    FROM camper
                    INNER JOIN application
                    ON application.camper_id=camper.camper_id
                    INNER JOIN program
                    ON application.program_id=program.program_id
                    INNER JOIN division
                    ON program.division_id=division.division_id 
                    INNER JOIN address
                    ON camper.address_id=address.address_id 
                    INNER JOIN city
                    ON address.city_id=city.city_id
                    INNER JOIN country
                    ON city.country_id=country.country_id
                    INNER JOIN camper_guardian
                    ON camper.camper_id=camper_guardian.camper_id
                    INNER JOIN guardian
                    ON camper_guardian.guardian_id=guardian.guardian_id
                    INNER JOIN relation
                    ON guardian.relation_id=relation.relation_id
                    INNER JOIN address as ga
                    ON ga.address_id=guardian.address_id
                    INNER JOIN city as gc
                    ON ga.city_id=gc.city_id
                    INNER JOIN country as gcnt
                    ON gc.country_id=gcnt.country_id
                    WHERE application.application_id={application_id};""".format(application_id=application_id)

        cursor.execute(sql_application)
        application_raw = cursor.fetchall()
        print(application_raw)
        dob = application_raw[0][5]
        print(dob)
        date_of_birth = dob.strftime("%Y-%m-%d")

        application = {
            'application_id': application_id,
            'program.name': application_raw[0][0],
            'application.date': application_raw[0][1],
            'camper.first_name': application_raw[0][2],
            'camper.middle_name': application_raw[0][3] if application_raw[0][3] != None else '---',
            'camper.last_name': application_raw[0][4],
            'camper.date_of_birth': date_of_birth,
            'camper.gender': 'Male' if application_raw[0][6] == 'M' else 'Female',
            'address.apartment_no': application_raw[0][7] if application_raw[0][7] != None else '---',
            'address.street_name': application_raw[0][8],
            'address.street_number': application_raw[0][9],
            'address.postal_code': application_raw[0][10] if application_raw[0][10] != None else '---',
            'city.city_name': application_raw[0][11],
            'country.country_name': application_raw[0][12],
            'camper.adr_same_as_guard': 'YES' if int(application_raw[0][13]) == 1 else 'NO',
            'guardian.first_name': application_raw[0][14],
            'guardian.middle_name': application_raw[0][15] if application_raw[0][15] != None else '---',
            'guardian.last_name': application_raw[0][16],
            'guardian.gender': 'Male' if application_raw[0][17] == 'M' else 'Female',
            'relation.relation_name': application_raw[0][18],
            'guardian.email_address': application_raw[0][19],
            'guardian.phone_number': application_raw[0][20],
            'guardian.address_id': application_raw[0][21],
            'ga.apartment_no': application_raw[0][22] if application_raw[0][22] != None else '---',
            'ga.street_number': application_raw[0][23],
            'ga.street_name': application_raw[0][24],
            'ga.postal_code': application_raw[0][25] if application_raw[0][25] != None else '---',
            'gc.city_name': application_raw[0][26],
            'gcnt.country_name': application_raw[0][27]
        }

        applicationarray = []
        applicationarray.append(application)
        return json.dumps(applicationarray)

    return ('success')

@app.route('/select', methods=['POST', 'GET'])
def select():
    if request.method == 'POST':
        application_id = request.form['application_id']
        print(application_id)
        sql_get_selected_application = """ SELECT * 
                                           FROM application 
                                           WHERE application_id={application_id}; """.format(application_id=application_id)

        cursor.execute(sql_get_selected_application)
        res_application = cursor.fetchall()

        print(res_application, res_application[0][5])

        applicationarray = []
        for rs in res_application:
            application_dict = {'Id': rs[5]}
            applicationarray.append(application_dict)

        return json.dumps(applicationarray)


@app.route('/update', methods=['POST', 'GET'])
def update():
    if request.method == 'POST':
        new_status_id = request.form['status_id']
        application_id_to_update = request.form['application_id']
        print("This: ", new_status_id, application_id_to_update)

        sql_old_status = """ SELECT status_id 
                             FROM application 
                             WHERE application_id={application_id}; """.format(application_id=application_id_to_update)

        cursor.execute(sql_old_status)
        old_status_id = cursor.fetchall()[0][0]

        sql_update_status = """ UPDATE application
                                SET application.status_id={status_id} 
                                WHERE application_id={application_id}; """.format(status_id=new_status_id, 
                                                                                    application_id=application_id_to_update)

        sql_set_date_of_decision = """ UPDATE application
                                       SET date_of_decision=CURDATE() 
                                       WHERE application_id={application_id}; """.format(application_id=application_id_to_update)

        sql_get_application_camper = """SELECT camper_id 
                                        FROM application 
                                        WHERE application_id={application_id}; """.format(application_id=application_id_to_update)

        if (int(new_status_id) != int(old_status_id)):
            if (int(new_status_id) == 1):
                cursor.execute(sql_get_application_camper)
                camper_id = cursor.fetchall()[0][0]

                sql_select_accepted_applications = """ SELECT * 
                                                       FROM application 
                                                       WHERE status_id=1 
                                                       AND camper_id={camper_id} """.format(camper_id=camper_id)

                cursor.execute(sql_select_accepted_applications)
                accepted_application = cursor.fetchall()

                if len(accepted_application) > 0:
                    flash("""The applicant already has been accepted 
                             either by other division or yours. 
                             If it is yours, reject the applicant's 
                             otherapplication(s) and update the status of the correct one""".format(
                                 id=application_id_to_update,  application_id=accepted_application[0][0]), 'danger')

                    return jsonify('success')
                else:
                    cursor.execute(sql_update_status)
                    cnx.commit()

                    cursor.execute(sql_set_date_of_decision)
                    cnx.commit()

                    sql_reject_remaining = """ UPDATE application
                                               SET status_id=2, date_of_decision=CURDATE()
                                               WHERE camper_id={camper_id} AND status_id != 1;""".format(camper_id=camper_id)

                    cursor.execute(sql_reject_remaining)
                    cnx.commit()

                    cursor.execute(sql_get_application_camper)
                    camper_id = cursor.fetchall()[0][0]
                    
                    flash("""Application #{id} has been accepted. If the applicant submitted 
                             more than one application, the rest of applications statuses 
                             were set to 'Rejected'.""".format(id=application_id_to_update), 'success')

                    return jsonify('success')

            elif (int(new_status_id) == 2):
                cursor.execute(sql_update_status)
                cnx.commit()

                cursor.execute(sql_set_date_of_decision)
                cnx.commit()

                flash("Application #{id} has been rejected.".format(
                    id=application_id_to_update), 'warning')

                return jsonify('success')

            elif (int(new_status_id) == 4):
                cursor.execute(sql_update_status)
                cnx.commit()

                flash("""Application #{id} status has been set to 'Reviewing'. 
                         Applicants will be able to see it on their profile.""".format(id=application_id_to_update), 'info')

                return jsonify('success')

        else:
            flash("""The status you selected is same as application's current status. 
                     The application #{id} status was not updated.""".format(id=application_id_to_update), 'info')

            return jsonify('success')

    return jsonify('failure')


@app.route("/your-applications", methods=['POST', 'GET'])
def apply_for_program():
    sql_get_user_name = """ SELECT CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name) 
                            FROM camper WHERE camper_id={camper_id}; """.format(camper_id=LOGGED_IN_CAMPER)

    cursor.execute(sql_get_user_name)
    username = cursor.fetchall()[0][0]

    sql_get_applications = """ SELECT application.application_id, program.`name` AS Program, 
                               division.name AS Division, date as Date, status_name as Status, 
                               date_of_decision as 'Date of decision' 
                               FROM application
                               INNER JOIN status
                               ON application.status_id=status.status_id
                               INNER JOIN program
                               ON application.program_id=program.program_id INNER JOIN division
                               ON program.division_id=division.division_id WHERE camper_id={camper_id}; """.format(camper_id=LOGGED_IN_CAMPER)

    cursor.execute(sql_get_applications)
    applications = cursor.fetchall()
    print(applications)

    return render_template("your-applications.html", applications=applications, username=username)


@app.route('/delete', methods=['POST'])
def delete():
    if request.method == 'POST':
        application_id_to_delete = request.form['application_id']
        print("This: ", application_id_to_delete)

        sql_delete_application = """ DELETE FROM application 
                                     WHERE application_id={application_id}; """.format(application_id=application_id_to_delete)
        
        cursor.execute(sql_delete_application)
        cnx.commit()

        flash("Application #{id} has been withdrawn".format(id=application_id_to_delete), 'success')

        return jsonify('success')


@app.route("/apply",  methods=['POST', 'GET'])
def apply():
    sql_get_user_name = """ SELECT CONCAT_WS(" ", camper.first_name, camper.middle_name, camper.last_name) 
                            FROM camper 
                            WHERE camper_id={}; """.format(LOGGED_IN_CAMPER)

    cursor.execute(sql_get_user_name)
    username = cursor.fetchall()[0][0]

    sql_get_division = """ SELECT * 
                           FROM division 
                           WHERE status='Active'; """

    cursor.execute(sql_get_division)
    divisions = cursor.fetchall()
    divisions.insert(0, (0, 'All'))

    print(divisions)

    sql_get_programs = """ SELECT program_id, division.name,program.name AS 'Program name', 
                           description, start_date as 'Start date', 
                           DATEDIFF(end_date,start_date) as 'Duration' 
                           FROM program
                           INNER JOIN division
                           ON program.division_id=division.division_id
                           INNER JOIN session
                           ON program.session_id=session.session_id
                           WHERE division.status='Active' 
                           AND CURDATE() BETWEEN session.application_period_start 
                           AND session.application_period_end 
                           AND visibility='Public'; """

    if request.method == "POST":
        req = request.form
        search_text = req['search_field']
        division_sort = req['division_dropdown']

        print("REQUEEEEEEEST, PROGRAM SORT: {}, SEARCH: {}".format(
            division_sort, search_text))
        print(int(division_sort) == 0)

        sql_division_sort_all = """ SELECT program_id, division.name,program.name AS 'Program name', 
                                    description, start_date as 'Start date', 
                                    DATEDIFF(end_date,start_date) as 'Duration' 
                                    FROM program
                                    INNER JOIN division
                                    ON program.division_id=division.division_id
                                    INNER JOIN session
                                    ON program.session_id=session.session_id
                                    WHERE division.status='Active' 
                                    AND CURDATE() BETWEEN session.application_period_start 
                                    AND session.application_period_end 
                                    AND program.name LIKE '%{search_criteria}%' 
                                    AND visibility='Public'; """.format(search_criteria=search_text)

        sql_get_programs_sort = """ SELECT program_id, division.name,program.name AS 'Program name', 
                                    description, start_date, 
                                    DATEDIFF(end_date,start_date) as 'Duration' 
                                    FROM program
                                    INNER JOIN division
                                    ON program.division_id=division.division_id
                                    INNER JOIN session
                                    ON program.session_id=session.session_id
                                    WHERE program.division_id={division_id} 
                                    AND division.status='Active' 
                                    AND CURDATE() BETWEEN session.application_period_start 
                                    AND session.application_period_end 
                                    AND program.name LIKE '%{search_criteria}%' 
                                    AND visibility='Public'; """.format(division_id=division_sort, search_criteria=search_text)

        programs = []
        if (int(division_sort) == 0):
            print("THIS executing")
            cursor.execute(sql_division_sort_all)
            programs = cursor.fetchall()
        else:
            print("Eexecuting by division")
            cursor.execute(sql_get_programs_sort)
            programs = cursor.fetchall()

        if (len(programs) < 1):
            flash("No programs found that match search criteria", 'info')

        print("This programs: {}".format(programs))

        return render_template(
            "apply-for-program.html", 
            divisions=divisions, 
            programs=programs, 
            search_text=search_text, 
            division_sort=int(division_sort), 
            username=username)
    else:
        cursor.execute(sql_get_programs)
        programs = cursor.fetchall()

        return render_template(
            "apply-for-program.html", 
            divisions=divisions, 
            programs=programs, 
            username=username)


@app.route("/create_application", methods=['POST', 'GET'])
def create_application():
    if request.method == 'POST':
        program_applied_for = request.form['program_id']
        print("PRGRAM APPLYING FOR: ", program_applied_for)

        # 1. check if aplicant does not exceed limit of applications
        sql_get_applications = """ SELECT application.program_id, status_name as Status 
                                   FROM application
                                   INNER JOIN status
                                   ON application.status_id=status.status_id
                                   INNER JOIN program
                                   ON application.program_id=program.program_id 
                                   INNER JOIN division
                                   ON program.division_id=division.division_id 
                                   WHERE camper_id={camper_id}; """.format(camper_id=LOGGED_IN_CAMPER)

        cursor.execute(sql_get_applications)
        applications = cursor.fetchall()
        print("APPLICATION: {}".format(applications))

        if (len(applications) < 3):
           for application in applications:
               print(program_applied_for, int(application[0]))
               print(int(program_applied_for) == int(application[0]))
               print(application)
               if application[1] == 'Accepted':
                   flash(
                       "Sorry, you already have been accepted for one of our programs :)", 'danger')
                   return jsonify('success')
               elif int(program_applied_for) == int(application[0]):
                   flash("You have already applied for this program", 'danger')
                   return jsonify('success')

           sql_create_application = """ INSERT INTO application (date, camper_id, program_id, status_id) 
                                        VALUES (curdate(), {camper_id}, {program_id}, 3); """.format(
                                        program_id=(program_applied_for), camper_id=LOGGED_IN_CAMPER)

           cursor.execute(sql_create_application)
           cnx.commit()
           flash("Application submitted. Thank you!", 'success')
           return jsonify('success')

        else:
            flash("""You have exceeded the limit of applications per applicant. 
            If you want to reaply for the program, withdraw the previous applicantion 
            and try applying again""", 'info')
            
            return jsonify('success')


if __name__ == "__main__":
    app.run(debug=True, port=8000)
    cnx.close()
