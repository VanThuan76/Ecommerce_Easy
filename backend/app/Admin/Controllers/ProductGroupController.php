<?php

namespace App\Admin\Controllers;

use App\Models\ProductGroup;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Show;
use Encore\Admin\Grid;

class ProductGroupController extends AdminController{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Nhóm sản phẩm';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProductGroup());

        $grid->column('title', __('Tên'));
        $grid->column('created_at', __('Ngày tạo'))->display(function ($createdAt) {
            return ConstantHelper::dateFormatter($createdAt);
        });
        $grid->column('updated_at', __('Ngày cập nhật'))->display(function ($createdAt) {
            return ConstantHelper::dateFormatter($createdAt);
        });
        $grid->fixColumns(0, 0);
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
        $show = new Show(ProductGroup::findOrFail($id));
        $show->field('title', __('Tên'));
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
        $form = new Form(new ProductGroup());
        $form->text('title', __('Tên'));
        return $form;
    }
}