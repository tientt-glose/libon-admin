@extends('index')
@section('title', 'Trang chủ')

@section ('before-styles-end')
<!-- custom -->
<link rel="stylesheet" href="{{ asset('css/dashboard.css') }}">
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Dashboard</h1>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
                <div class="card card-orange card-outline">
                    <div class="card-header">
                        <h5 class="m-0">Giới thiệu</h5>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title font-weight-bolder" style="color: #d53d26">LibOn</h5>
                        <p class="card-text">
                            là hệ thống thư viện điện tử tiện lợi với tính năng đặt mượn sách PickupBook.
                            PickupBook với quy trình đặt mượn sách dễ dàng, nhanh chóng, hiện đại sẽ giải quyết vấn đề
                            của bạn.
                        </p>
                        <a href="#" class="btn btn-default btn-orange">Go to LibOn</a>
                    </div>
                </div><!-- /.card -->
            </div>
            <!-- /.col-md-6 -->
            <div class="col-lg-6">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h5 class="m-0">Featured - Chức năng nổi bật</h5>
                    </div>
                    <div class="card-body">
                        <h6 class="card-title font-weight-bold">Quản lý đơn mượn</h6>
                        <p class="card-text"> Kiểm tra trạng thái của các đơn mượn hiện có trên hệ thống và tiến hành
                            nhập/trả sách</p>
                        <a href="{{ route('order.orders.index') }}" class="btn btn-primary">Chuyển tới</a>
                    </div>
                    <div class="card-body">
                        <h6 class="card-title font-weight-bold">Quản lý đầu sách</h6>
                        <p class="card-text"> Quản lý các đầu sách hiện có trên hệ thống kèm thao tác thêm, sửa xóa</p>
                        <a href="{{ route('book.books.index') }}" class="btn btn-primary">Chuyển tới</a>
                    </div>
                    <div class="card-body">
                        <h6 class="card-title font-weight-bold">Quản lý người dùng</h6>
                        <p class="card-text"> Quản lý người dùng hiện có trên hệ thống kèm thao tác phân quyền</p>
                        <a href="{{ route('book.books.index') }}" class="btn btn-primary">Chuyển tới</a>
                    </div>
                </div>
            </div>
            <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content -->
<!-- /.content-wrapper -->
@endsection
