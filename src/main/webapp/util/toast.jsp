<div id="myToast" class="toast" style="position: absolute; top: 0; right: 0;" data-autohide="true" data-delay="5000">
  <div class="toast-header">
    <strong class="mr-auto">Notification</strong>
    <small>Just now</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
  </div>
  <div class="toast-body">
    <%= request.getAttribute("result") %>
  </div>
</div>
