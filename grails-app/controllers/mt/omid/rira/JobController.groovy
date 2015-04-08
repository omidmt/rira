package mt.omid.rira

import static org.springframework.http.HttpStatus.NOT_FOUND

class JobController extends SecureController {

    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Job.list(params), model: [jobInstanceCount: Job.count()]
    }

    def show(Job jobInstance) {
        respond jobInstance
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'job.label', default: 'Job'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
