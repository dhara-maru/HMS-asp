using Microsoft.AspNetCore.Mvc;

namespace HospitalManagementDhara.Controllers
{
    public class DoctorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult DoctorList()
        {
            return View("DoctorList");
        }

        public IActionResult AddDoctor()
        {
            return View("AddDoctor");
        }

        public IActionResult AddDoctorDepartment()
        {
            return View("AddDoctorDepartment");
        }

        public IActionResult DoctorDepartmentList() {
            return View("DoctorDepartmentList");
        }
    }
}
