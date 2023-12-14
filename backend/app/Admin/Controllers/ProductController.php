<?php

namespace App\Admin\Controllers;

use App\Models\Product;
use App\Models\ProductGroup;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Show;
use Encore\Admin\Grid;

class ProductController extends AdminController{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Sản phẩm';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());

        $grid->column('productGroup.title', __('Nhóm sản phẩm'));
        $grid->column('title', __('Tên'));
        $grid->column('description', __('Mô tả'));
        $grid->column('image', __('Ảnh đại diện'))->image();
        $grid->column('price', __('Giá/sản phẩm'));
        $grid->column('quantity', __('Số lượng'));
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
        $show = new Show(Product::findOrFail($id));
        $show->field('productGroup.title', __('Nhóm sản phẩm'));
        $show->field('title', __('Tên'));
        $show->field('description', __('Mô tả'));
        $show->field('image', __('Ảnh đại diện'))->image();
        $show->field('price', __('Giá/sản phẩm'));
        $show->field('quantity', __('Số lượng'));
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
        $productGroup = ProductGroup::get()->pluck('title', 'id');

        $form = new Form(new Product());
        $form->select('product_group_id', __('Nhóm sản phẩm'))->options($productGroup)->required();
        $form->text('title', __('Tên'));
        $form->textarea('description', __('Mô tả'));
        $form->image('image', __('Ảnh sản phẩm'));
        $form->number('price', __('Giá/sản phẩm'));
        $form->number('quantity', __('Số lượng'));
        return $form;
    }
}