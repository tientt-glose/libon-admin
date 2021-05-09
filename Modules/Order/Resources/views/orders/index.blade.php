@extends('index')
@section('title', 'Quản lý đơn mượn')

@section('before-adminLTE-styles-end')
<!-- Select2 -->
<link rel="stylesheet" href="{{ asset('admin-lte3/plugins/select2/css/select2.min.css') }}">
<!-- DataTables -->
<link rel="stylesheet" href="{{ asset('admin-lte3/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
<link rel="stylesheet" href="{{ asset('admin-lte3/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
<!-- toastr -->
<link rel="stylesheet" href="{{ asset('admin-lte3/plugins/toastr/toastr.min.css') }}">
@endsection

@section ('before-styles-end')
<!-- custom -->
<link rel="stylesheet" href="{{ asset('css/order.css') }}">
@endsection

@section('script')
<!-- Select2 -->
<script src="{{ asset('admin-lte3/plugins/select2/js/select2.full.min.js') }}"></script>
<!-- DataTables  & Plugins -->
<script src="{{ asset('admin-lte3/plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('admin-lte3/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ asset('admin-lte3/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('admin-lte3/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
<!-- toastr -->
<script src="{{ asset('admin-lte3/plugins/toastr/toastr.min.js') }}"></script>

@if($errors->any())
@foreach ($errors->all() as $error)
<script>
    toastr.error('{{ $error }}')
</script>
@endforeach
@endif

@if (session()->has('success'))
<script>
    toastr.success('{{ session()->get('success') }}')
</script>
@endif

<script>
    $(document).ready(function() {
    //Initialize Select2 Elements
        $('.select2').select2({
            width: 'resolve',
            dropdownParent: $('#category-select'),
        })
    });
</script>

<script>
    $(function() {
        table = $('#table-order').DataTable({
            processing: true,
            serverSide: true,
            autoWidth: false,
            searching: false,
            responsive: true,
            lengthMenu: [5, 10, 25, 50],
            ajax: {
                url: '{{ route("order.orders.get") }}',
                type: 'get',
                data: function(d) {
                    // d.category_id = $('#category option:selected').val();
                    d.csrf = '{{ csrf_field() }}';
                }
            },
            columns: [
                {data: 'id', sortable: true},
                {data: 'user_name', sortable: true},
                {data: 'user_card', orderable: false},
                {data: 'user_code', orderable: false},
                {data: 'status', orderable: false},
                {data: 'restore_deadline', orderable: false},
                {data: 'created_at', orderable: false},
                {data: 'pick_time', orderable: false},
                {data: 'restore_time', sortable: true},
                {data: 'actions', orderable: false},
            ],
            order: [[0, 'desc' ]],
            language: {
                lengthMenu: 'Hiển thị _MENU_ bản ghi trên một trang',
                zeroRecords: 'Không tìm thấy bản ghi phù hợp',
                infoEmpty: 'Không có dữ liệu',
                infoFiltered: '(lọc từ tổng số _MAX_ bản ghi)',
                info: 'Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ kết quả',
                paginate: {
                    previous:   '«',
                    next:       '»'
                },
                processing: '<i class="fa fa-spinner fa-pulse fa-fw"></i> Loading'
            },
            columnDefs: [
            ]
        });

        $('.filter-cate').change(function() {
            table.draw();
        });
    });
</script>
@endsection

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Quản lý đơn mượn</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Danh sách đơn mượn</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="card card-primary card-outline">
        <div class="card-header">
            <a href="{{ route('order.orders.create') }}" class="btn btn-primary float-right">
                Thêm đơn mượn</a>
            {{-- <div class="filter float-right" id="category-select">
                <select class="form-control filter-cate select2" style="width: 100%;" name="cate_id" id="category">
                    <option value="">--Loại sách--</option>
                    @foreach($categories as $cate)
                    <option value="{{ $cate->id }}">{{ $cate->name }}</option>
            @endforeach
            </select>
        </div> --}}
    </div>
    <div class="card-body p-2">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover projects" id="table-order">
                <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Người mượn</th>
                        <th>CMT/CCCD</th>
                        <th>MSSV/MCB</th>
                        <th>Trạng thái</th>
                        <th>Hạn trả</th>
                        <th>Ngày tạo</th>
                        <th>Ngày đến lấy</th>
                        <th>Ngày trả</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

    </div>
    <!-- /.card-body -->
    </div>
    <!-- /.card -->
</section>
<!-- /.content -->
@endsection
