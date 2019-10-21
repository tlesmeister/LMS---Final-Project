using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace JobBoardLMS.DATA.EF//.Metadata
{
    #region Course Completions
    public class CourseCompletionsClassMetadata
    {
        //Primary Key
        public int CourseCompletionID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(12, ErrorMessage = "* User ID Required must be 12 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string UserID { get; set; }
        //Foreign Key
        public int CourseID { get; set; }
        [Display(Name = "Complete Date")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public System.DateTime DateCompleted { get; set; }
    }
    [MetadataType(typeof(CourseCompletionsClassMetadata))]
    public partial class CourseCompletionsClass { }
    #endregion

    #region Courses
    public class CoursesClassMetadata
    {
        //Primary Key
        public int CourseID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(20, ErrorMessage = "* Course name must be 20 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string CourseName { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Description must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }
        [Display(Name = "Course Class")]
        public bool IsActive { get; set; }
    }
    [MetadataType(typeof(CoursesClassMetadata))]
    public partial class CoursesClass { }
    #endregion

    #region Lessons
    public class LessonClassMetadata
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
    [MetadataType(typeof(LessonClassMetadata))]
    public partial class LessonClass { }
    #endregion

    #region LessonViews
    public class LessonViewsClassMetadata
    {
        //Primary Key
        public int LessonViewID { get; set; }
        //Foreign Key
        public string UserID { get; set; }
        //Foreign Key
        public int LessonID { get; set; }
        [Display(Name = "Start Date")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public System.DateTime DateViewed { get; set; }
    }
    [MetadataType(typeof(LessonViewsClassMetadata))]
    public partial class LessonViewsClass { }
    #endregion

    #region UserDetails
    public class UserDetailsClassMetadata
    {
        //Primary Key
        public string UserID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* First name must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Last name must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string LastName { get; set; }
    }
    [MetadataType(typeof(UserDetailsClassMetadata))]
    public partial class UserDetailsClass { }
    #endregion
}
