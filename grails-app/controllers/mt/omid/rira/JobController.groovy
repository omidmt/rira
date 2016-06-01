package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class JobController extends SecureController {

    static allowedMethods = []

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Job.list(params), model: [jobInstanceCount: Job.count()]
    }

    def show(Job jobInstance) {
        respond jobInstance
    }

    def create() {
        respond new Job(params)
    }

    def clone(Job jobInstance) {
        render view: 'create', model: [jobInstance: new Job(jobInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [jobInstance: new Job(params)])
    }

    @Transactional
    def save(Job jobInstance) {
        if (jobInstance == null) {
            notFound()
            return
        }

        if (jobInstance.hasErrors()) {
            respond jobInstance.errors, view: 'create'
            return
        }

        jobInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'job.label', default: 'Job'), jobInstance])
                redirect jobInstance
            }
            '*' { respond jobInstance, [status: CREATED] }
        }
    }

    def edit(Job jobInstance) {
        respond jobInstance
    }

    def editEmbeded(Job jobInstance) {
        render(template: "embededForm", model: [jobInstance: jobInstance])
    }

    @Transactional
    def update(Job jobInstance) {
        if (jobInstance == null) {
            notFound()
            return
        }

        if (jobInstance.hasErrors()) {
            respond jobInstance.errors, view: 'edit'
            return
        }

        jobInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Job.label', default: 'Job'), jobInstance])
                redirect jobInstance
            }
            '*' { respond jobInstance, [status: OK] }
        }
    }

    def download() {
        def job = Job.get(params.id)
        if(job) {
            def file = new File("${Konfig.KONFIGS.jobLogDir}/${job.logFileName}")
            if (file.exists()) {
                response.setContentType("application/octet-stream")
                response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
                response.outputStream << file.bytes
            }
            else {
                render "Log file doesn't exist"
            }
        }
        else {
            render "Invalid job"
        }
     }

    @Transactional
    def delete(Job jobInstance) {

        if (jobInstance == null) {
            notFound()
            return
        }

        jobInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Job.label', default: 'Job'), jobInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
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
