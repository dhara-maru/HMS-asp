using Microsoft.AspNetCore.Mvc;

namespace HospitalManagementDhara.Controllers
{
    public class PatientController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult PatientList()
        {
            return View("PatientList");
        }
        public IActionResult AddPatient()
        {
            return View("AddPatient");
        }
    }
}
