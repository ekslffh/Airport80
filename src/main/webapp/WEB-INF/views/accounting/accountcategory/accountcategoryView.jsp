<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal -->
<div class="modal fade" id="accountModal" tabindex="-1" role="dialog" aria-labelledby="accountModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="accountModalLabel">계정과목 정보</h5>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tr>
                         <th style="width: 100px;">설명</th> <!-- 원하는 너비로 지정 -->
                        <td>${accountcategory.acaInfo}</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Add JavaScript to show the modal on page load -->
<script>
    $(document).ready(function () {
        // Show the modal on page load
        $('#accountModal').modal('show');

        // Close the modal when "Close" button or modal backdrop is clicked
        $('#accountModal .close, #accountModal').click(function () {
            $('#accountModal').modal('hide');
         // Go back in the browser history
            history.back();
        });
    });
</script>