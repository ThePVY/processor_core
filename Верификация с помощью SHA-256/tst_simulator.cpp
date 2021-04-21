#include <iostream>
using namespace std;

uint32_t rotr(uint32_t i, uint32_t n){
	return( (i>>n)|(i<<(32-n)) );
}

void simulator(){
//line: 7   cmd: 0
uint32_t Rs0;
//line: 8   cmd: 0
uint32_t Rma;
//line: 9   cmd: 0
uint32_t Rt2;
//line: 10   cmd: 0
uint32_t Rs1;
//line: 11   cmd: 0
uint32_t Rch;
//line: 12   cmd: 0
uint32_t Rt1;
//line: 13   cmd: 0
uint32_t Ra;
//line: 14   cmd: 0
uint32_t Rb;
//line: 15   cmd: 0
uint32_t Rc;
//line: 16   cmd: 0
uint32_t Rd;
//line: 17   cmd: 0
uint32_t Re;
//line: 18   cmd: 0
uint32_t Rf;
//line: 19   cmd: 0
uint32_t Rg;
//line: 20   cmd: 0
uint32_t Rh;
//line: 21   cmd: 0
uint32_t Rd0;
//line: 22   cmd: 0
uint32_t Rd1;
//line: 23   cmd: 0
uint32_t Rd2;
//line: 24   cmd: 0
uint32_t Rd3;
//line: 25   cmd: 0
uint32_t Rend;
//line: 26   cmd: 0
uint32_t Ri;
//line: 27   cmd: 0
uint32_t Rtmp1;
//line: 28   cmd: 0
uint32_t Rtmp2;
//line: 29   cmd: 0
uint32_t *Radr0;
//line: 30   cmd: 0
uint32_t *Radr1;
//line: 31   cmd: 0
uint32_t *Rarr0;
//line: 32   cmd: 0
uint32_t *Rarr1;
uint32_t message =  1 ;
uint32_t h0 =  0x6A09E667;
uint32_t h1 =  0xBB67AE85;
uint32_t h2 =  0x3C6EF372;
uint32_t h3 =  0xA54FF53A;
uint32_t h4 =  0x510E527F;
uint32_t h5 =  0x9B05688C;
uint32_t h6 =  0x1F83D9AB;
uint32_t h7 =  0x5BE0CD19;
uint32_t k[64] = { 0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1, 0x923F82A4, 0xAB1C5ED5,
  0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3, 0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174,
  0xE49B69C1, 0xEFBE4786, 0x0FC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA,
  0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147, 0x06CA6351, 0x14292967,
  0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13, 0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85,
  0xA2BFE8A1, 0xA81A664B, 0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070,
  0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A, 0x5B9CCA4F, 0x682E6FF3,
   0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208, 0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2 };
uint32_t w[64] = { 0 };
//line: 67   cmd: 494
	Radr0 = &h0;
//line: 68   cmd: 495
	Ra = *Radr0;
//line: 71   cmd: 496
	Radr0 = &h1;
//line: 72   cmd: 497
	Rb = *Radr0;
//line: 74   cmd: 498
	Radr0 = &h2;
//line: 75   cmd: 499
	Rc = *Radr0;
//line: 77   cmd: 500
	Radr0 = &h3;
//line: 78   cmd: 501
	Rd = *Radr0;
//line: 80   cmd: 502
	Radr0 = &h4;
//line: 81   cmd: 503
	Re = *Radr0;
//line: 83   cmd: 504
	Radr0 = &h5;
//line: 84   cmd: 505
	Rf = *Radr0;
//line: 86   cmd: 506
	Radr0 = &h6;
//line: 87   cmd: 507
	Rg = *Radr0;
//line: 89   cmd: 508
	Radr0 = &h7;
//line: 90   cmd: 509
	Rh = *Radr0;
//line: 95   cmd: 510
	Rd0 = 0;
//line: 96   cmd: 511
	Rd1 = (0xC000 << 16);
//line: 97   cmd: 512
	Rd0 |= Rd1;
//line: 98   cmd: 513
	Radr0 = w;
//line: 99   cmd: 514
	*Radr0 = Rd0;
//line: 101   cmd: 515
	Rd0 = 1;
//line: 102   cmd: 516
	Radr0 = w + 15;
//line: 103   cmd: 517
	*Radr0 = Rd0;
//line: 108   cmd: 518
	Rend = 64;
//line: 109   cmd: 519
	Ri = 16;
//line: 110   cmd: 520
	Rarr0 = w;
//line: 112   cmd: 521
	Rend -= Ri;
//line: 114   cmd: 522
	M0:
//line: 115   cmd: 522
	Radr0 = Rarr0;
//line: 116   cmd: 523
	Radr0 += Ri;
//line: 117   cmd: 524
	Rtmp1 = 15;
//line: 118   cmd: 525
	Radr0 -= Rtmp1;
//line: 119   cmd: 526
	Rd0 = *Radr0;
//line: 121   cmd: 527
	Rd1 = Rd0;
//line: 122   cmd: 528
	Rd1 = rotr(Rd1,7);
//line: 124   cmd: 529
	Rd2 = Rd0;
//line: 125   cmd: 530
	Rd2 = rotr(Rd2,18);
//line: 127   cmd: 531
	Rd3 = Rd0;
//line: 128   cmd: 532
	Rd3 = Rd3 >> 3;
//line: 130   cmd: 533
	Rd1 ^= Rd2;
//line: 131   cmd: 534
	Rd1 ^= Rd3;
//line: 132   cmd: 535
	Rs0 = Rd1;
//line: 135   cmd: 536
	Radr0 = Rarr0;
//line: 136   cmd: 537
	Radr0 += Ri;
//line: 137   cmd: 538
	Rtmp1 = 2;
//line: 138   cmd: 539
	Radr0 -= Rtmp1;
//line: 139   cmd: 540
	Rd0 = *Radr0;
//line: 141   cmd: 541
	Rd1 = Rd0;
//line: 142   cmd: 542
	Rd1 = rotr(Rd1,17);
//line: 144   cmd: 543
	Rd2 = Rd0;
//line: 145   cmd: 544
	Rd2 = rotr(Rd2,19);
//line: 147   cmd: 545
	Rd3 = Rd0;
//line: 148   cmd: 546
	Rd3 = Rd3 >> 10;
//line: 150   cmd: 547
	Rd1 ^= Rd2;
//line: 151   cmd: 548
	Rd1 ^= Rd3;
//line: 152   cmd: 549
	Rs1 = Rd1;
//line: 155   cmd: 550
	Radr0 = Rarr0;
//line: 156   cmd: 551
	Radr0 += Ri;
//line: 157   cmd: 552
	Rtmp1 = 16;
//line: 158   cmd: 553
	Radr0 -= Rtmp1;
//line: 159   cmd: 554
	Rd0 = *Radr0;
//line: 161   cmd: 555
	Radr0 = Rarr0;
//line: 162   cmd: 556
	Radr0 += Ri;
//line: 163   cmd: 557
	Rtmp1 = 7;
//line: 164   cmd: 558
	Radr0 -= Rtmp1;
//line: 165   cmd: 559
	Rd1 = *Radr0;
//line: 167   cmd: 560
	Rd0 += Rd1;
//line: 168   cmd: 561
	Rd0 += Rs0;
//line: 169   cmd: 562
	Rd0 += Rs1;
//line: 171   cmd: 563
	Radr0 = Rarr0;
//line: 172   cmd: 564
	Radr0 += Ri;
//line: 173   cmd: 565
	*Radr0 = Rd0;
//line: 176   cmd: 566
	Rtmp1 = 1;
//line: 177   cmd: 567
	Ri += Rtmp1;
//line: 178   cmd: 568
	Rend -= Rtmp1;
//line: 180   cmd: 569
	if(Rend== 0){
		 goto M1;
	}
//line: 181   cmd: 570
	goto M0;
//line: 185   cmd: 571
	M1:
//line: 186   cmd: 571
	Rend = 64;
//line: 187   cmd: 572
	Ri = 0;
//line: 188   cmd: 573
	Rarr0 = w;
//line: 190   cmd: 574
	Rarr1 = k;
//line: 192   cmd: 575
	Rend -= Ri;
//line: 195   cmd: 576
	M2:
//line: 196   cmd: 576
	Rtmp1 = Ra;
//line: 197   cmd: 577
	Rtmp1 = rotr(Rtmp1,2);
//line: 198   cmd: 578
	Rs0 = Rtmp1;
//line: 200   cmd: 579
	Rtmp1 = Ra;
//line: 201   cmd: 580
	Rtmp1 = rotr(Rtmp1,13);
//line: 202   cmd: 581
	Rs0 ^= Rtmp1;
//line: 204   cmd: 582
	Rtmp1 = Ra;
//line: 205   cmd: 583
	Rtmp1 = rotr(Rtmp1,22);
//line: 206   cmd: 584
	Rs0 ^= Rtmp1;
//line: 209   cmd: 585
	Rtmp1 = Ra;
//line: 210   cmd: 586
	Rtmp2 = Rb;
//line: 211   cmd: 587
	Rtmp1 &= Rtmp2;
//line: 212   cmd: 588
	Rma = Rtmp1;
//line: 214   cmd: 589
	Rtmp1 = Ra;
//line: 215   cmd: 590
	Rtmp2 = Rc;
//line: 216   cmd: 591
	Rtmp1 &= Rtmp2;
//line: 217   cmd: 592
	Rma ^= Rtmp1;
//line: 219   cmd: 593
	Rtmp1 = Rb;
//line: 220   cmd: 594
	Rtmp2 = Rc;
//line: 221   cmd: 595
	Rtmp1 &= Rtmp2;
//line: 222   cmd: 596
	Rma ^= Rtmp1;
//line: 225   cmd: 597
	Rtmp1 = Re;
//line: 226   cmd: 598
	Rtmp1 = rotr(Rtmp1,6);
//line: 227   cmd: 599
	Rs1 = Rtmp1;
//line: 229   cmd: 600
	Rtmp1 = Re;
//line: 230   cmd: 601
	Rtmp1 = rotr(Rtmp1,11);
//line: 231   cmd: 602
	Rs1 ^= Rtmp1;
//line: 233   cmd: 603
	Rtmp1 = Re;
//line: 234   cmd: 604
	Rtmp1 = rotr(Rtmp1,25);
//line: 235   cmd: 605
	Rs1 ^= Rtmp1;
//line: 238   cmd: 606
	Rt2 = Rs0;
//line: 239   cmd: 607
	Rt2 += Rma;
//line: 242   cmd: 608
	Rtmp1 = Re;
//line: 243   cmd: 609
	Rtmp2 = Rf;
//line: 244   cmd: 610
	Rtmp1 &= Rtmp2;
//line: 245   cmd: 611
	Rch = Rtmp1;
//line: 247   cmd: 612
	Rtmp1 = Re;
//line: 248   cmd: 613
	Rtmp1 = ~Rtmp1;
//line: 249   cmd: 614
	Rtmp2 = Rg;
//line: 250   cmd: 615
	Rtmp1 &= Rtmp2;
//line: 251   cmd: 616
	Rch ^= Rtmp1;
//line: 254   cmd: 617
	Radr0 = Rarr0;
//line: 255   cmd: 618
	Radr1 = Rarr1;
//line: 256   cmd: 619
	Radr0 += Ri;
//line: 257   cmd: 620
	Radr1 += Ri;
//line: 258   cmd: 621
	Rt1 = *Radr0;
//line: 259   cmd: 622
	Rtmp1 = *Radr1;
//line: 260   cmd: 623
	Rt1 += Rtmp1;
//line: 261   cmd: 624
	Rt1 += Rh;
//line: 262   cmd: 625
	Rt1 += Rs1;
//line: 263   cmd: 626
	Rt1 += Rch;
//line: 272   cmd: 627
	Rh = Rg;
//line: 273   cmd: 628
	Rg = Rf;
//line: 274   cmd: 629
	Rf = Re;
//line: 275   cmd: 630
	Re = Rd;
//line: 276   cmd: 631
	Re += Rt1;
//line: 277   cmd: 632
	Rd = Rc;
//line: 278   cmd: 633
	Rc = Rb;
//line: 279   cmd: 634
	Rb = Ra;
//line: 280   cmd: 635
	Ra = Rt1;
//line: 281   cmd: 636
	Ra += Rt2;
//line: 283   cmd: 637
	Rtmp1 = 1;
//line: 284   cmd: 638
	Ri += Rtmp1;
//line: 285   cmd: 639
	Rend -= Rtmp1;
//line: 286   cmd: 640
	if(Rend== 0){
		 goto M3;
	}
//line: 287   cmd: 641
	goto M2;
//line: 289   cmd: 642
	M3:
//line: 291   cmd: 642
	Radr0 = &h0;
//line: 292   cmd: 643
	Rd0 = *Radr0;
//line: 293   cmd: 644
	Rd0 += Ra;
//line: 294   cmd: 645
	*Radr0 = Rd0;
//line: 296   cmd: 646
	Radr0 = &h1;
//line: 297   cmd: 647
	Rd0 = *Radr0;
//line: 298   cmd: 648
	Rd0 += Rb;
//line: 299   cmd: 649
	*Radr0 = Rd0;
//line: 301   cmd: 650
	Radr0 = &h2;
//line: 302   cmd: 651
	Rd0 = *Radr0;
//line: 303   cmd: 652
	Rd0 += Rc;
//line: 304   cmd: 653
	*Radr0 = Rd0;
//line: 306   cmd: 654
	Radr0 = &h3;
//line: 307   cmd: 655
	Rd0 = *Radr0;
//line: 308   cmd: 656
	Rd0 += Rd;
//line: 309   cmd: 657
	*Radr0 = Rd0;
//line: 311   cmd: 658
	Radr0 = &h4;
//line: 312   cmd: 659
	Rd0 = *Radr0;
//line: 313   cmd: 660
	Rd0 += Re;
//line: 314   cmd: 661
	*Radr0 = Rd0;
//line: 316   cmd: 662
	Radr0 = &h5;
//line: 317   cmd: 663
	Rd0 = *Radr0;
//line: 318   cmd: 664
	Rd0 += Rf;
//line: 319   cmd: 665
	*Radr0 = Rd0;
//line: 321   cmd: 666
	Radr0 = &h6;
//line: 322   cmd: 667
	Rd0 = *Radr0;
//line: 323   cmd: 668
	Rd0 += Rg;
//line: 324   cmd: 669
	*Radr0 = Rd0;
//line: 326   cmd: 670
	Radr0 = &h7;
//line: 327   cmd: 671
	Rd0 = *Radr0;
//line: 328   cmd: 672
	Rd0 += Rh;
//line: 329   cmd: 673
	*Radr0 = Rd0;
//line: 332   cmd: 674
	Radr0 = &h0;
//line: 333   cmd: 675
	R0 = *Radr0;
//line: 335   cmd: 676
	Radr0 = &h1;
//line: 336   cmd: 677
	R1 = *Radr0;
//line: 338   cmd: 678
	Radr0 = &h2;
//line: 339   cmd: 679
	R2 = *Radr0;
//line: 341   cmd: 680
	Radr0 = &h3;
//line: 342   cmd: 681
	R3 = *Radr0;
//line: 344   cmd: 682
	Radr0 = &h4;
//line: 345   cmd: 683
	R4 = *Radr0;
//line: 347   cmd: 684
	Radr0 = &h5;
//line: 348   cmd: 685
	R5 = *Radr0;
//line: 350   cmd: 686
	Radr0 = &h6;
//line: 351   cmd: 687
	R6 = *Radr0;
//line: 353   cmd: 688
	Radr0 = &h7;
//line: 354   cmd: 689
	R7 = *Radr0;
cout.unsetf(ios::dec);
cout.setf(ios::hex);
cout<< "hash:" << endl;
cout<<"0: " << h0 << endl;
cout<<"1: " << h1 << endl;
cout<<"2: " << h2 << endl;
cout<<"3: " << h3 << endl;
cout<<"4: " << h4 << endl;
cout<<"5: " << h5 << endl;
cout<<"6: " << h6 << endl;
cout<<"7: " << h7 << endl;
cout<<endl;
cout<<"total: " << h0<<h1<<h2<<h3<<h4<<h5<<h6<<h7<<endl;

}
