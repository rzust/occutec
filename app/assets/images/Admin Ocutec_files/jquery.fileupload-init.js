// /*
//  * jQuery File Upload Plugin JS Example 7.0
//  * https://github.com/blueimp/jQuery-File-Upload
//  *
//  * Copyright 2010, Sebastian Tschan
//  * https://blueimp.net
//  *
//  * Licensed under the MIT license:
//  * http://www.opensource.org/licenses/MIT
//  */

// /*jslint nomen: true, unparam: true, regexp: true */
// /*global $, window, document */

$(document).ready(function(){
  'use strict';
  $('#fileupload').fileupload({
      filesContainer: $('tbody.files'),
      uploadTemplateId: null,
      downloadTemplateId: null,
      uploadTemplate: function (o) {
          var rows = $();
          $.each(o.files, function (index, file) {
              var row = $('<tr class="template-upload fade">' +
                  '<td><span class="preview"></span></td>' +
                  '<td><p class="name"></p>' +
                  '<div class="error"></div>' +
                  '</td>' +
                  '<td><p class="size"></p>' +
                  '<div class="progress"></div>' +
                  '</td>' +
                  '<td>' +
                  (!index && !o.options.autoUpload ?
                      '<button class="btn btn-primary start" disabled><i class="icon-upload icon-white"> </i><span>Start</span></button>' : '') +
                  (!index ? '<button class="btn btn-warning cancel"><i class="icon-ban-circle icon-white"> </i><span>Cancel</span></button>' : '') +
                  '</td>' +
                  '</tr>');
              row.find('.name').text(file.name);
              row.find('.size').text(o.formatFileSize(file.size));
              if (file.error) {
                  row.find('.error').text(file.error);
              }
              rows = rows.add(row);
          });
          return rows;
      },
      downloadTemplate: function (o) {
          var rows = $();
          $.each(o.files, function (index, file) {
              var row = $('<tr class="template-download fade">' +
                  '<td><span class="preview"></span></td>' +
                  '<td><p class="name"></p>' +
                  (file.error ? '<div class="error"></div>' : '') +
                  '</td>' +
                  '<td><span class="size"></span></td>' +
                  '<td><button class="btn btn-danger delete"><i class="icon-trash icon-white"> </i><span>Delete</span></button></td>' +
                  '</tr>');
              row.find('.size').text(o.formatFileSize(file.size));
              if (file.error) {
                  row.find('.name').text(file.name);
                  row.find('.error').text(file.error);
              } else {
                  row.find('.name').append($('<a></a>').text(file.name));
                  if (file.thumbnailUrl) {
                      row.find('.preview').append(
                          $('<a></a>').append(
                              $('<img>').prop('src', file.thumbnailUrl)
                          )
                      );
                  }
                  row.find('a')
                      .attr('data-gallery', '')
                      .prop('href', file.url);
                  row.find('.delete')
                      .attr('data-type', file.delete_type)
                      .attr('data-url', file.delete_url);
              }
              rows = rows.add(row);
          });
          return rows;
      }
  });
  $('#fileupload').fileupload(

        'option',
        'redirect',
        window.location.href.replace(
            /\/[^\/]*$/,
            '/cors/result.html?%s'
        )
    );

  $('#fileupload').fileupload('option', {
        //url: "http://localhost:3000/admin/projects/"+project_id+"/gallery_images",
        autoUpload: true,
        multipart: true,
        maxFileSize: 10000000,
        acceptFileTypes:/(\.|\/)(gif|jpe?g|png)$/i,
        sequentialUploads: true,
        process:[
            {
                action:'load',
                fileTypes:/^image\/(gif|jpeg|png)$/,
                maxFileSize:20000000 // 20MB
            },
            {
                action:'save'
            }
        ],
        formData: [
          { name: 'authenticity_token', value: $('meta[name="csrf-token"]').attr('content') }
        ]
    });


            // {
            //     action:'resize',
            //     maxWidth:960,
            //     maxHeight:640
            // },
  // if ($.support.cors) {
  //       $.ajax({
  //           url:'http://localhost:3000/',
  //           type:'HEAD',
  //       }).fail(function () {
  //               $('<span class="alert alert-error"/>')
  //                   .text('Upload server currently unavailable - ' +
  //                   new Date())
  //                   .appendTo('#fileupload');
  //           });
  //   }

$('#fileupload').bind('fileuploaddestroy', function (e, data) {
  var auth_token;
  auth_token = $('meta[name="csrf-token"]').attr('content');
  data.url = data.url + '?authenticity_token=' + encodeURIComponent(auth_token);
});

// $('#fileupload').bind('fileuploadsend', function(e, data) {
//   var auth_token;
//   auth_token = $('meta[name="csrf-token"]').attr('content');
//   data.url = data.url + '?authenticity_token=' + encodeURIComponent(auth_token); 
// });
  // $('#fileupload').fileupload({
  //   progress: function (e, data) {
  //       console.log('progress');
  //   },
  //   start: function (e) {
  //       console.log('start');
  //   },
  //   done: function (e) {
  //       console.log('done');
  //   }
  // });


});    

// if($("#fileupload").length != 0) {
// //     $(function () {
// //         alert("asdf");
// //         'use strict';

// //         // Initialize the jQuery File Upload widget:
// //         $('#fileupload').fileupload({
// //             // Uncomment the following to send cross-domain cookies:
// //             //xhrFields: {withCredentials: true},
// // //        url: 'server/php/'
// //         });

// //         // Enable iframe cross-domain access via redirect option:
// //         $('#fileupload').fileupload(
// //             'option',
// //             'redirect',
// //             window.location.href.replace(
// //                 /\/[^\/]*$/,
// //                 '/cors/result.html?%s'
// //             )
// //         );

// //         // Load existing files:
// //         $.ajax({
// //             // Uncomment the following to send cross-domain cookies:
// //             //xhrFields: {withCredentials: true},
// //             url: $('#fileupload').fileupload('option', 'url'),
// //             dataType: 'json',
// //             context: $('#fileupload')[0]
// //         }).done(function (result) {
// //                 $(this).fileupload('option', 'done')
// //                     .call(this, null, {result: result});
// //             });
// //     });
// };

// $('#fileupload').fileupload({
//     filesContainer: $('tbody.files'),
//     uploadTemplateId: null,
//     downloadTemplateId: null,
//     uploadTemplate: function (o) {
//         var rows = $();
//         $.each(o.files, function (index, file) {
//             var row = $('<tr class="template-upload fade">' +
//                 '<td><span class="preview"></span></td>' +
//                 '<td><p class="name"></p>' +
//                 '<div class="error"></div>' +
//                 '</td>' +
//                 '<td><p class="size"></p>' +
//                 '<div class="progress"></div>' +
//                 '</td>' +
//                 '<td>' +
//                 (!index && !o.options.autoUpload ?
//                     '<button class="start" disabled>Start</button>' : '') +
//                 (!index ? '<button class="cancel">Cancel</button>' : '') +
//                 '</td>' +
//                 '</tr>');
//             row.find('.name').text(file.name);
//             row.find('.size').text(o.formatFileSize(file.size));
//             if (file.error) {
//                 row.find('.error').text(file.error);
//             }
//             rows = rows.add(row);
//         });
//         return rows;
//     },
//     downloadTemplate: function (o) {
//         var rows = $();
//         $.each(o.files, function (index, file) {
//             var row = $('<tr class="template-download fade">' +
//                 '<td><span class="preview"></span></td>' +
//                 '<td><p class="name"></p>' +
//                 (file.error ? '<div class="error"></div>' : '') +
//                 '</td>' +
//                 '<td><span class="size"></span></td>' +
//                 '<td><button class="delete">Delete</button></td>' +
//                 '</tr>');
//             row.find('.size').text(o.formatFileSize(file.size));
//             if (file.error) {
//                 row.find('.name').text(file.name);
//                 row.find('.error').text(file.error);
//             } else {
//                 row.find('.name').append($('<a></a>').text(file.name));
//                 if (file.thumbnailUrl) {
//                     row.find('.preview').append(
//                         $('<a></a>').append(
//                             $('<img>').prop('src', file.thumbnailUrl)
//                         )
//                     );
//                 }
//                 row.find('a')
//                     .attr('data-gallery', '')
//                     .prop('href', file.url);
//                 row.find('.delete')
//                     .attr('data-type', file.delete_type)
//                     .attr('data-url', file.delete_url);
//             }
//             rows = rows.add(row);
//         });
//         return rows;
//     }
// });
