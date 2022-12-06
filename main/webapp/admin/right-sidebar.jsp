<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="right-bar">

  <div class="rightbar-title">
    <a href="javascript:void(0);" class="right-bar-toggle float-right">
      <i class="dripicons-cross noti-icon"></i>
    </a>
    <h5 class="m-0">Cấu hình</h5>
  </div>

  <div class="rightbar-content h-100" data-simplebar>

    <div class="p-3">


      <!-- Settings -->
      <h5 class="mt-3">Chế độ tối</h5>
      <hr class="mt-1" />

      <div class="custom-control custom-switch mb-1">
        <input type="radio" class="custom-control-input" name="color-scheme-mode" value="light"
               id="light-mode-check" checked />
        <label class="custom-control-label" for="light-mode-check">Tắt</label>
      </div>

      <div class="custom-control custom-switch mb-1">
        <input type="radio" class="custom-control-input" name="color-scheme-mode" value="dark"
               id="dark-mode-check" />
        <label class="custom-control-label" for="dark-mode-check">Bật</label>
      </div>


      <!-- Left Sidebar-->
      <h5 class="mt-4">Thanh điều hướng</h5>
      <hr class="mt-1" />
      <div class="custom-control custom-switch mb-1">
        <input type="radio" class="custom-control-input" name="theme" value="default" id="default-check"
               checked />
        <label class="custom-control-label" for="default-check">Mặc định</label>
      </div>

      <div class="custom-control custom-switch mb-1">
        <input type="radio" class="custom-control-input" name="theme" value="light" id="light-check" />
        <label class="custom-control-label" for="light-check">Chế độ sáng</label>
      </div>

      <div class="custom-control custom-switch mb-3">
        <input type="radio" class="custom-control-input" name="theme" value="dark" id="dark-check" />
        <label class="custom-control-label" for="dark-check">Chế độ tối</label>
      </div>

      <div class="custom-control custom-switch mb-1">
        <input type="radio" class="custom-control-input" name="compact" value="fixed" id="fixed-check"
               checked />
        <label class="custom-control-label" for="fixed-check">Cố định</label>
      </div>

      <div class="custom-control custom-switch mb-1">
        <input type="radio" class="custom-control-input" name="compact" value="condensed"
               id="condensed-check" />
        <label class="custom-control-label" for="condensed-check">Thu gọn</label>
      </div>

      <div class="custom-control custom-switch mb-1">
        <input type="radio" class="custom-control-input" name="compact" value="scrollable"
               id="scrollable-check" />
        <label class="custom-control-label" for="scrollable-check">Di chuyển</label>
      </div>

      <button class="btn btn-primary btn-block mt-4" id="resetBtn">Đặt lại cấu hình</button>

    </div> <!-- end padding-->

  </div>
</div>

<div class="rightbar-overlay"></div>