using Microsoft.AspNetCore.Mvc;

namespace HospitalManagementDhara.Controllers
{
    public class DepartmentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult DepartmentList()
        {
            return View("DepartmentList");
        }

        public IActionResult AddDepartment() {
            return View("AddDepartment");
        }
    }
}
