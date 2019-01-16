
      function ValidateFileUpload(Source, args) {
          var fuData = document.getElementById('<%= MainContent_uploadPayslip.ClientID %>');
          var FileUploadPath = fuData.value;

          if (FileUploadPath == '') {
              // There is no file selected 
              args.IsValid = false;
          }
          else {
              var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

              if (Extension == "pdf") {
                  args.IsValid = true; // Valid file type
              }
              else {
                  args.IsValid = false; // Not valid file type
              }
          }
      }

function ValidatePhotograph(Source, args) {
    var fuData = document.getElementById('<%= MainContent_uploadPhoto.ClientID %>');
    var FileUploadPath = fuData.value;

    if (FileUploadPath == '') {
        // There is no file selected 
        args.IsValid = false;
    }
    else {
        var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

        if (Extension == "jpg" || Extension == "jpeg") {
            args.IsValid = true; // Valid file type
        }
        else {
            args.IsValid = false; // Not valid file type
        }
    }
}
function ValidateSignature(Source, args) {
    var fuData = document.getElementById('<%= MainContent_uploadSignature.ClientID %>');
    var FileUploadPath = fuData.value;

    if (FileUploadPath == '') {
        // There is no file selected 
        args.IsValid = false;
    }
    else {
        var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

        if (Extension == "jpg"|| Extension=="jpeg" ) {
            args.IsValid = true; // Valid file type
        }
        else {
            args.IsValid = false; // Not valid file type
        }
    }
}
