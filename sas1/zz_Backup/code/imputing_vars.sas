   format IM_techSupportEval BEST12.;
   _ngbys_ = 1;
   _igby_ = 0;
   _tnn_ntrans_ = 1;

   _fuzcmp_ = 2.22044604925e-10;

   array _tnn_vnames_{3}  _temporary_ ;
   _tnn_vnames_{1} = IM_avgDiscountValue12;
   _tnn_vnames_{2} = IM_techSupportEval;
   _tnn_vnames_{3} = IM_customerAge;

   array _vnn_names_{3} _temporary_;
   _vnn_names_{1} = avgDiscountValue12;
   _vnn_names_{2} = customerAge;
   _vnn_names_{3} = techSupportEval;

   array _tnn_ntransvars_{1}  _temporary_   (3 );

   array _tv_nn_indices_{3}  _temporary_   (1 3 2 );

   IM_avgDiscountValue12 = .;
   IM_techSupportEval = .;
   IM_customerAge = .;

   array _tnn_imputetype_{1}   _temporary_   (1 );


   array _tnn_imputeuniquevals_{3}   _temporary_   (16.1217279124315 3.59469240048251
      27.3473764841057 );

   _ct_ = 0;
   _trimmed_ = 0;
   _impct_ = 0;

   do _i_ = 1 to _tnn_ntrans_;
      do _j_ = 1 to _tnn_ntransvars_{_i_};

         if (_tnn_imputetype_{_i_} ~= 0) then
            _impct_ + 1;
         _ct_ + 1;
         _numval_ = _vnn_names_{_tv_nn_indices_{_ct_}};

         if missing(_numval_) then
            do;
               if _tnn_imputetype_{_i_} = 0 then
                  goto _impute_done1_;
               else _numval_ = _tnn_imputeuniquevals_{3 *_igby_ + _impct_};
            end;
         _impute_done1_:;
         _tnn_vnames_{_ct_} = _numval_;
      end;
   end;

   IM_avgDiscountValue12 = _tnn_vnames_{1};
   IM_techSupportEval = _tnn_vnames_{2};
   IM_customerAge = _tnn_vnames_{3};
   drop _ngbys_ _igby_ _tnn_ntrans_ _fuzcmp_ _ct_ _trimmed_ _impct_ _i_ _j_ _numval_ ;


