using Microsoft.AspNetCore.Mvc;

namespace HospitalManagementDhara.Controllers
{
    public class AppointmentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AddAppointment()
        {
            return View("AddAppointment");
        }

        public IActionResult AppointmentList()
        {
            return View("AppointmentList");
        }
    }
}
