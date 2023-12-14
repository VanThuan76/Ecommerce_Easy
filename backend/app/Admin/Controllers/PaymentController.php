<?php

namespace App\Admin\Controllers;

use App\Models\Payment;
use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Show;
use Encore\Admin\Grid;

class PaymentController extends AdminController
{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Đơn hàng';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Payment());

        $grid->column('user_id', __('Tên khách hàng'))->display(function ($userId) {
            $user = User::where("id", $userId)->first();
            if ($user) {
                return $user->name;
            } else {
                return "";
            }
        });
        $grid->column('date', __('Ngày thanh toán'))->display(function ($date) {
            return ConstantHelper::dateFormatter($date);
        });
        $grid->column('address', __('Địa chỉ đặt hàng'));
        $grid->column('note', __('Lưu ý đặt hàng'));
        $grid->column('type', __('Loại thanh toán'))->display(function ($status) {
            return $status == 1 ? "Chuyển khoản" : "Thanh toán khi nhận hàng";
        });
        $grid->column('status', __('Trạng thái thanh toán'))->display(function ($status) {
            return $status == 0 ? "Đã thanh toán" : "Chưa thanh toán";
        });
        $grid->column('created_at', __('Ngày tạo'))->display(function ($createdAt) {
            return ConstantHelper::dateFormatter($createdAt);
        });
        $grid->column('updated_at', __('Ngày cập nhật'))->display(function ($createdAt) {
            return ConstantHelper::dateFormatter($createdAt);
        });
        $grid->fixColumns(0, 0);
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableView();
        });
        $grid->disableCreateButton();
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Payment::findOrFail($id));

        $show->field('user_id', __('Tên khách hàng'))->as(function ($userId) {
            $user = User::where("id", $userId)->first();
            if ($user) {
                return $user->name;
            } else {
                return "";
            }
        });
        $show->field('date', __('Ngày thanh toán'))->as(function ($date) {
            return ConstantHelper::dateFormatter($date);
        });
        $show->field('address', __('Địa chỉ đặt hàng'));
        $show->field('note', __('Lưu ý đặt hàng'));
        $show->field('type', __('Loại thanh toán'));
        $show->field('status', __('Trạng thái thanh toán'));
        $show->field('created_at', __('Ngày tạo'))->as(function ($createdAt) {
            return ConstantHelper::dateFormatter($createdAt);
        });
        $show->field('updated_at', __('Ngày cập nhật'))->as(function ($createdAt) {
            return ConstantHelper::dateFormatter($createdAt);
        });
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $users = User::get()->pluck('name', 'id');

        $form = new Form(new Payment());

        $form->select('user_id', __('Tên khách hàng'))->options($users)->required()->readOnly();
        $form->date('date', __('Ngày thanh toán'))->readOnly();
        $form->text('address', __('Địa chỉ đặt hàng'))->readOnly();
        $form->textarea('note', __('Lưu ý đặt hàng'))->readOnly();
        $form->select('type', __('Loại thanh toán'))->options([1 => 'Chuyển khoản', 2 => 'Thanh toán khi nhận hàng'])->readOnly();
        $form->select('status', __('Trạng thái thanh toán'))->options([0 => 'Đã thanh toán', 1 => 'Chưa thanh toán']);
        return $form;
    }
}