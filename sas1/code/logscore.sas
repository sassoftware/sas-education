   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 01Oct2024:18:56:04
     -------------------------------------------------------*/

   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_0_0_{16} _temporary_;
   array _beta_0_0_{16} _temporary_ (   -2.51652329638239
           0.05556032894118
           0.78751723825604
           0.06871286064746
          -0.06871286064746
          -0.10774577250347
           0.20507436073752
          -0.07665987988392
           0.20518207462435
           0.34581932445578
           0.12612974099135
            -0.223184629716
          -0.15079563607906
           0.18115438681628
          -0.77264768752944
           0.14866102228103);
   array _xtmp_0_0_{24} _temporary_;
   array _xcomp_0_0_{24} _temporary_;
   array _xclas_0_0_{24} _temporary_;

   length _customerSubscrStat_ $8; drop _customerSubscrStat_;
   _customerSubscrStat_ = left(trim(put(customerSubscrStat,$8.)));
   length _DemHomeOwner_ $9; drop _DemHomeOwner_;
   _DemHomeOwner_ = left(trim(put(DemHomeOwner,$DEMHOMEOWNER.)));
   length _customerGender_ $3; drop _customerGender_;
   _customerGender_ = left(trim(put(customerGender,$3.)));
   if missing(regionPctCustomers)
      or missing(regionMedHomeVal)
      or missing(log_AvgPurchaseAmountTotal)
      or missing(socialMediaAdCount36)
      or missing(intAdExposureCountAll)
      or missing(log_customersales)
      or missing(IM_techSupportEval)
      or missing(AvgPurchasePerAd12)
      or missing(IM_customerAge)
      or missing(numOfTotalReturns)
      or missing(log_AvgPurchasePerAd12)
      then do;
         _badval_ = 1;
         goto skip_0_0;
   end;

   do _i_=1 to 16; _xrow_0_0_{_i_} = 0; end;
   do _i_=1 to 24; _xtmp_0_0_{_i_} = 0; end;
   do _i_=1 to 24; _xcomp_0_0_{_i_} = 0; end;
   do _i_=1 to 24; _xclas_0_0_{_i_} = 0; end;

   _xtmp_0_0_[1] = 1;

   _temp_ = 1;
   select (_customerGender_);
      when ('F') _xtmp_0_0_[2] = _temp_;
      when ('M') _xtmp_0_0_[3] = _temp_;
      when ('U') _xtmp_0_0_[4] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_customerSubscrStat_);
      when ('Gold') _xtmp_0_0_[5] = _temp_;
      when ('Member') _xtmp_0_0_[6] = _temp_;
      when ('Platinum') _xtmp_0_0_[7] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_DemHomeOwner_);
      when ('HomeOwner') _xtmp_0_0_[8] = _temp_;
      when ('Unknown') _xtmp_0_0_[9] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _xtmp_0_0_[10] = regionPctCustomers;

   _xtmp_0_0_[11] = numOfTotalReturns;

   _xtmp_0_0_[14] = intAdExposureCountAll;

   _xtmp_0_0_[15] = socialMediaAdCount36;

   _xtmp_0_0_[16] = regionMedHomeVal;

   _xtmp_0_0_[17] = AvgPurchasePerAd12;

   _xtmp_0_0_[18] = IM_techSupportEval;

   _xtmp_0_0_[19] = IM_customerAge;

   _xtmp_0_0_[21] = log_AvgPurchaseAmountTotal;

   _xtmp_0_0_[23] = log_customersales;

   _xtmp_0_0_[24] = log_AvgPurchasePerAd12;

   do _j_=1 to 1; _xrow_0_0_{_j_+0} = _xtmp_0_0_{_j_+0}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+1} = _xtmp_0_0_{_j_+1}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+2} = _xtmp_0_0_{_j_+4}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+3} = _xtmp_0_0_{_j_+7}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+4} = _xtmp_0_0_{_j_+8}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+5} = _xtmp_0_0_{_j_+9}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+6} = _xtmp_0_0_{_j_+10}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+7} = _xtmp_0_0_{_j_+13}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+8} = _xtmp_0_0_{_j_+14}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+9} = _xtmp_0_0_{_j_+15}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+10} = _xtmp_0_0_{_j_+16}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+11} = _xtmp_0_0_{_j_+17}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+12} = _xtmp_0_0_{_j_+18}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+13} = _xtmp_0_0_{_j_+20}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+14} = _xtmp_0_0_{_j_+22}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+15} = _xtmp_0_0_{_j_+23}; end;

   do _i_=1 to 16;
      _linp_ + _xrow_0_0_{_i_} * _beta_0_0_{_i_};
   end;

   skip_0_0:
   length I_LostCustomer $12;
   label I_LostCustomer = 'Into: LostCustomer';
   array _levels_0_{2} $ 12 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_LostCustomer = 'Predicted: LostCustomer';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_LostCustomer = 1 / (1+exp(-_linp_));
      end; else do;
         P_LostCustomer = exp(_linp_) / (1+exp(_linp_));
      end;
      if P_LostCustomer >= 0.5                  then do;
         I_LostCustomer = _levels_0_{1};
      end; else do;
         I_LostCustomer = _levels_0_{2};
      end;
   end; else do;
      _linp_ = .;
      P_LostCustomer = .;
      I_LostCustomer = ' ';
   end;


