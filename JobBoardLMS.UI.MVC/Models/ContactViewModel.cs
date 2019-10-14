using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace JobBoardLMS.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "* Your Name is Required")]
        public string Name { get; set; }


        [Required(ErrorMessage = "* Your Email is Required")]
        [DataType(DataType.EmailAddress, ErrorMessage = "* Check Email Format")]
        public string Email { get; set; }

        [Required(ErrorMessage = "* Subject is Required")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "* Message is Required")]
        [UIHint("MultilineText")]
        public string Message { get; set; }
    }
}