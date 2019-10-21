using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace JobBoardLMS.DATA.EF
{
    #region Course Completions
    public class CourseCompletionMetadata
    {
        //Primary Key
        public int CourseCompletionID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(12, ErrorMessage = "* User ID Required must be 12 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string UserID { get; set; }
        //Foreign Key
        public int CourseID { get; set; }
        [Display(Name = "Date Completed")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public System.DateTime DateCompleted { get; set; }
    }
    [MetadataType(typeof(CourseCompletionMetadata))]
    public partial class CourseCompletion { }
    #endregion

    #region Courses
    public class CoursesMetadata
    {
        //Primary Key
        public int CourseID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(20, ErrorMessage = "* Course name must be 20 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Course Name")]
        public string CourseName { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Description must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }
        [Display(Name = "Course Class")]
        public bool IsActive { get; set; }
    }
    [MetadataType(typeof(CoursesMetadata))]
    public partial class Courses { }
    #endregion

    #region Lessons
    public class LessonMetadata
    {
        //Primary Key
        public int LessonID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(20, ErrorMessage = "* Title must be 20 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Lesson Title")]
        public string LessonTitle { get; set; }
        //Foreign Key
        public int CourseID { get; set; }
        [StringLength(30, ErrorMessage = "* Introduction must be 30 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Introduction { get; set; }
        [Display(Name = "Video URL")]
        public string VideoURL { get; set; }
        [Display(Name = "PDF File Name")]
        public string PdfFileName { get; set; }
        [Display(Name = "Lesson")]
        public bool IsActive { get; set; }

    }
    [MetadataType(typeof(LessonMetadata))]
    public partial class Lesson { }
    #endregion

    #region LessonViews
    public class LessonViewMetadata
    {
        //Primary Key
        public int LessonViewID { get; set; }
        //Foreign Key
        public string UserID { get; set; }
        //Foreign Key
        public int LessonID { get; set; }
        [Display(Name = "Date Viewed")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public System.DateTime DateViewed { get; set; }
    }
    [MetadataType(typeof(LessonViewMetadata))]
    public partial class LessonView { }
    #endregion

    #region UserDetails
    public class UserDetailMetadata
    {
        //Primary Key
        public string UserID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* First name must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Last name must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
    }
    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail { }
    #endregion
}
