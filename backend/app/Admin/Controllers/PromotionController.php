<?php

namespace App\Admin\Controllers;

use App\Models\Product;
use App\Models\Promotion;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Show;
use Encore\Admin\Grid;

class PromotionController extends AdminController
{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Khuyến mại';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Promotion());

        $grid->column('product.title', __('Sản phẩm áp dụng'));
        $grid->column('title', __('Tên'));
        $grid->column('discount', __('Giảm giá(%)'));
        $grid->column('from_at', __('Hiệu lực từ'));
        $grid->column('to_at', __('Hết hạn'));
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
        $show = new Show(Promotion::findOrFail($id));

        $show->field('product.title', __('Sản phẩm áp dụng'));
        $show->field('title', __('Tên'));
        $show->field('discount', __('Giảm giá(%)'));
        $show->field('from_at', __('Áp dụng từ'));
        $show->field('to_at', __('Hết hạn'));
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
        $product = Product::get()->pluck('title', 'id');

        $form = new Form(new Promotion());
        $form->select('product_id', __('Sản phẩm áp dụng'))->options($product)->required();
        $form->text('title', __('Tên'));
        $form->number('discount', __('Giảm giá(%)'));
        $form->date('from_at', __('Áp dụng từ'));
        $form->date('to_at', __('Hết hạn'));
        return $form;
    }
}