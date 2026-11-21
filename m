Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250008;
	b=JNujaNo3xRb0h0fgjJnzHozzcZQPRUx6hT237JzcPHMGJ8z7ZIiAO+MJ55OP1I8cnEa4
	 pFa/NJDmUM8IVR12J4rMr7RswtWdWtR06xeQgRZWqPYU9sArgLM/LkiMRe6DM24BxFunY
	 iSnN02sPmw4reHOm4EHgVOCQMCx/VL7pnSCFwdabA+HvpL5W/Ws1KM6n+itIFn14thAyn
	 UYSkSbXdqeKrPObZKP7o1yeX9y5PCxNhrL7ao847tlgdjPrIimiporvAhIAoFD+ZYT8n4
	 b2kRkOX306U1BUyMdjD6m+JCqKFJsubWXgSKcvlQhEe2R2c7tgApcobL5uuZgU/yKSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250008;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=PfdlcHJuF0PGL8Kd820cfaOlsW1sWpWcEpawFoM43ho=;
	b=OIwbwbn7lUfAJrPRiweE0/Hax6KumbpnwML/BJBVXurJQaCY1PPKmAiR5ARJ8PxibwOq
	 PmSoNXnvjLbs3yBUvwDO1ibYL1lP5bL77k+GyZcXKFZlufuJLHk5O22Z56J/OuPReydOV
	 pyx6YAc8CJrwhguaTuE4fXuwXf3w4+7gHNhAH2oINWv1suENgnFbvkBYr7j8Fi0z9zXh1
	 YolCWYjJkOzusWl4UT7J585vq2yBeZwDuaFbE1w/VyHGKQT6KBDI7aYT1VlaUmGoagxAF
	 oMPlhoJw8HpM74ZZVsKRZzL3gwXRqQKhfka07EfikmarHlrS+gLw14NiD4H9GVySggg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=KYTvu16I;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B5F606A320
	for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 08:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B5F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=KYTvu16I
DKIM2-Signature:  i=1; m=1; t=1795249998;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:g5AmiJxSdVlpe5spROUCDvH4NOx1
   c7+ZnkgBAwCMN66rctrhCobNwO+0d1VEeFxTKp7SUEfDLScApSIFRbHnlIMHmw1x8ypED40XhRL
   jVXf6q/l70Wqn7bR0nrClH8FFQmmK75FEEL1EHylvcvtpZXZ4pkw5lgjPiDc9fDkg1s/yJE6Hbf
   TTuA0e3SXjhEcgeUx93N6GRGb3jIq9F515o1eS6IK01yecKgkpgxcu1WFWOo5he6Od6jdeaHC2M
   HTNbtbMPX4mvA7KVW/b+8yBOWXJuVpIdMEuyGaVV4HdfojC4xzft76slBG7X62eC8g+PsGpdsao
   lPaKlUuQlsWIYg==;
Message-Instance:  m=1;
 h=sha256:
   tgp1iU4UpZT6oGMKAMnSzDfsTXaLr5ZOkXABfrCbRnM=:
   rG7WbwjiISNSZ3ewrnvBFv2kJ83TCFir7rS9VlqlEMU=,
  sha512:
   DNGlV8EYSlYRyWcaJFCETQy9LhKgT73Tu0I3H9sW2gunueCTCjL1SjWTeFykez82WGCO9/EeclIJNcMPDKP2cA==:
   EgGtdipRqNF0vsIfUCsDynb5RSlVEOA1xrxzcoNCvGmTXTtvhVC6kHmWZZsuJyIALJSXIvLi+6+zqSzevgdy0w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795249980; x=1795854780; i=markus.elfring@web.de;
	bh=PfdlcHJuF0PGL8Kd820cfaOlsW1sWpWcEpawFoM43ho=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KYTvu16IojgXt+qvcj5KCz5Y8I+/PzmDl6mIs3t+cyZguOdh9P9W/EzSCod8BbJ+
	 ratMjiAlCKZwC4jZAXUc5hBbH3On32DxlEzBPKkYZK8CfP9PvkaLanUD1WVSwfm/x
	 obHtr/OZCoiM6OWAqXdBBhrCL24XblYE/rSL5J49X3B+SHXeZphRtQPbRL48aV2U6
	 pIhntBPYi+YYWNaM61C0ppK+EJu/rUtw4krHSU30pPnA/zJH6HB09XEuEUqQrUs1O
	 OJajNvaqcSYt9MlG+2aq28kmwmCJJnQxyoAVv60On3e1lQEpGOLgN0DvhudWmviBh
	 5U9J0TXkBHNZppv7tw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrbz-1xvruj1UrV-00SYwG; Sat, 21
 Nov 2026 09:33:00 +0100
Message-ID: <357f5490-8920-4199-a4ac-3f105cabbc78@web.de>
Date: Sat, 21 Nov 2026 09:32:49 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dmaengine@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Frank Li <Frank.li@oss.nxp.com>, Serge Semin <fancer.lancer@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v3] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BNGa82SLznYD7luLmUeD7k2czRYen8JC522T48GKtSEzlXrXvvM
 OyEnj4KH34vDM9IPDg2vMdyh4tdsidd7QGpKDW/zkNe2F6lq3n+IeIHif8fw6aH7SApqqo+
 3ksBDqSlg35OMSnj/ka9B7SNaR3XjTFepALwN6kbH+Zb0TTVId2Gp2JN8HLBERJ439CsDw2
 ZDNgUaKRxYZlSi7PVoorg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z/ZwsT54tUY=;SwXzVLq6AZqe+WYXIAHlyRiN83y
 ySv2OzpzMughBI9UdPcuMh1p+eTiqD2zUmGFSk5PT+lMVQ53v4JZIOwvo93DItYnXxaa1xREj
 mJjVqtWnRHFiD/Lar0CXrow+hgsS2QoRtVEvHSGi7wZcJEVtvAcJO2YLmpMo7vmRxuI9DkNSn
 uaAcTeH8Eajg2lULlhE0z7uUqfhqA40WfknQJTr2soJ+zUdaM+kNXH78TxIrFpMUiH+9mWUP4
 7EWa/Q2BrVtpaXqbVcr6xNPUHwHbhSP4U4yzWhbcxivAMGhBsIajPOVtgPDoGWX4pgdhcFJYU
 W8FrdAYPeNjay6wzEVO6o+Ay42SPig68w4gTFZ/xFI0D2eZ6rNgVLDHLi1FzyW3ZvzIeiNwsO
 u8+t8BI+DWzr2+mlC47QpUh3cr6UeDJgmDCAkmLKkodHdkhXjLH1Ef71XILa6WIunKTQf3hwy
 W63ZBNI67ebap2QuKH3V9PWAEsZi+Br3xBrPDrT4ByQRPuu0TlcfT5JtoV8gMVaiHsKfk5yVu
 ppCX7gs/Rh0cfp22/9SXYI5tcx2dvWCcz1+MzhtlexrIlugec4QvgnP4+nDlOof0Lert2vkCn
 vlGGThx2un+Xnu7tyiUJut66iKerCb5BUUWz+8RRseSnsT0BAFCfULkQ51l8PQAHqWaBcKZT3
 FADOZseMeTOJogCY0C+An5Z21K3TW8JkMNVOAicgCxLgoZ7eVqNcg0ncfhTsDC6JwbUyt7L34
 LISyNtRGUn8uao+InpJlmsS1QdttOjbnrafNm4Zn+FD/AUyVqI5luSE9Fdxp+qhkVgoqROsNO
 d97JHvTQdQipvrEqgSWCCOKs1Gkve67fqYXXe2oGvCqbDgZCw1jSE4WQKFhbRd0TfQTCKEvZo
 dyxNBBaJo2Bu+ryLZw6PiiCH9H71ABu3dd5yLIoKkk7gO2zfM8tboK4pdU8qUw75KUz8Pvnmw
 OoJHure0j5SwgM6u/dcEPZcesFBa7ZylYfcjKEFztVtHuU6BU8ZHp9udvnJXAXxU3XGHT5oVt
 N4k7Ql0uhUrppwzd1cTI0ovbhbs3uwG/k63f9ueXkIMbXmo3iYKmVHIxXA52BMZnBCykKL01X
 dOE03ZBvJiVRVzSqj/7aZ4EKWrwlPo/bEAGd4AWz1RxC/nuuoqKRvOWHVoAJcYliWOaJ9ZuX0
 jniHrnnBXpVE0BPN63xVwk9IP0z/XHFGGinKNLq1qHMQ2kIclnedwgGbO6Jvtn4qs5oKtTJHL
 MIKNpnOFB/Ww9CCL8X6sqLGyTE9NbAsl3Q6Rfe5GgrDPp4ngAPI3OY/NOLZqdw/BFX7+IbBnM
 2S9l1RH7tPw6/3OCbsOcVWKShnnhi/NfYBwMng78Hrj5NxhhQo8F9UxF2WfPQ2EKy3vxTD80b
 AFSPQHhxMuoPAfwLarj3Lfl2klGFeiYGjmWSGXbyLzyKO6o+6CxuW1uL0+eXD02tbHglB8Egy
 q9WT1HsvzG+9uFJUno+mbCdNsYgnX+cIrIyp4cxMglLLVJcEd52umQhlqDOTJngnlTYP0Y70Q
 fdqFTCIWNVmwWe+kyDwvL75lI8oVVsu+6WjLn8a1HbAxD3jvcr2QZ53jcKjag6CxeevUBEg+t
 o2f0u/ibREKyIJp70HJpzspZSVztursiFOn62W7n09eBENTADFKbISDJ2C2Ds6iPmj6gbdxbo
 rGipy4PN3BhMQ0SDc5i1IXJAeM2ledX45ZfOG9xCdwh0tUDUCKi8RTNJ/ndjUiV3M1ffVqCgw
 wNfnJd2tk2uhgY2aO4VS7JeadOkzGUm+ZpdgUfjan2nPMocfZXi61mINgkmLZc9GFoOusXfeB
 8AVPqQRVRWJ3OwZ5aBU4Gk8VwcUTpOsac/Qa2Npo6XLmncDOK0sRzVFgyuVk2wDpNi6/r2/FX
 ot6wNHAgK+IGOrFQS56aIHSbeOLC+4egNXXz/g0I+lJR1XNUqFlno0R34D88N7Pgx9kPEG5yD
 wIH/84wSrwYrjMhm+wc1k6u9copt8EKhi+SyCrHwayHCzgOOe5x8oPxGa5NP7Ffa8eT0dhblP
 ONQUx/dVI9jjaTTEh9oqvioewDGzoD2GHEqUbs/mu2P5IN2iB0y/oZAz/f3Sf++X6WjOFd1tA
 cIVd5uJwQ5LXyrDuTR4t7yRV7akTaG3FyrQBOhJYkOkN4tB0LwW12A14nNWXZdmcAKBhOclQh
 Rv6mXBggJeOjy58CstyMekiYRJFqqsuDhwMcW6hasBBLql/46ZhD94Plqt4dK/h5BeeX24IuE
 KfeUsYBo1g7T/CZLwaH/HnJk30fSOjRMDsEY8z4uz2int8esEcxR+IfuvkzfOfirZhV9yi1Jh
 wpCbsE4oTJ6aRjb6qZ2MZ68JOs2UnjnzBv5hfjY4FLQ15oNS4zFnFI3HhaKVyeD0DS0Xm3uRT
 s4KGWsI6WZ0x+uAP9jd3xOlZf5yaAGUjbrzbCe7xHcIhHwB7RTp7yaVsWjRTA+0RiRZ4yUw/4
 IBdDLws+zkF5KwUibirZ0SDEZ0fb7/rTH0eb3tsAPLPqLOcj9ccntGdgtXZ9s8P5L/NrW9YEs
 GDrvtdjYR6eR9UykbeS1S1wLkrRmlqGogr/CFC4xrtuyDgcAkvb6NsiSNjwuQcfKROpWFDd1f
 3Yap5O5Li2FDBpl0m/aN/v5ZVJCyHJjTnvJ65Ler/o26/+dfKCfha0nMvGVEcHe/UWj3cq+gv
 b3s+fJyzWVwvKhs14x/1AvEhVO5sScHipDfnicMTGOpsqPKvc2Zu0NUGUkszafPxlU+zljexD
 pt9CwItKR1oZeMs9zQ1j+PkMWpW6GUWMkk5izTr6BjSJXsJaKMP6KaWNKzq0X57VcmVhCR2t7
 4PSpIkGIhxB78EBeTBG1fwXnMOjqBuwb9R9MpQ47yLe9iQt/EOQ23Z6GE87r9i49rZKzmps12
 b49NnQ1wyKUlY5KQonCL7h/fYC83ZjImwFPtysLg+mlwesjK48wapJFRQ+vKh+7qGWFLVbDfs
 2HQoBpv4GQiEC4tvm3cq+2olvTDyaAPM2TY/BsX/zhj9kzcRQZKQWLM3qLWdETfzlprXHnHUx
 /cok8gOPsyzOu6Ob3+FqqA8Yr9atXU7LxhLOVs05Uo184NO/89GJ67mfL4rwLVs+cLNczO+nf
 DOPaDCVa+EwfC2H8LHy6kyE5NnlHUR5xclp+TkPcjSUOgjJoQ8ztjCR83M5p57n2R53kC5Qiz
 ft2/6U/TNxL28HBVC2/LJRPmZmT5tSWAtn0rbRjXr5a6Z3NBPIpvmNWgQPtOuW4cMy7ZldFGd
 IrvN/OnuNef0yFNgcJaZs1sKK2Ehui5QGO4zxQffU1Qzhv1oTKnJDuAPvR7Wl4bEkCg0RVkn6
 Ny0Ly6BHn9kNY0nsf/P9qtyZ6p/Y0ONpNb87B8vAXrOj4HpvvLZBZFMIEG/3d41fNiEz0Wiom
 VArnsKAkYgHw6Mvh4SvhFSdP7UuXtUmplnVftlK7NmXPuPnJuZ2xlie3a876ywNZJhGZAY84W
 AV55xWcvx/lNgASGmAkejKNBVJ/uEnCaLohUw3w1fukUqrKZHs5u6zaL9ukFJOGm8+M4ytHPa
 OE4erIJ0VDKL7RB4Kkes27hDQDw5Pt/sduvE1c54o/0jCI0VjJjK3zKZK6So6cocSWHT1yl8c
 +5u9URgM6e62X394dcl50QSu5jFwZor8ZnAiF3FWMqCFnxidtnfAVUbDTTgksAEN4p8ZaExI6
 XkrpbNy3Dnjxyc16UlXo+UZtdcAYuRpz9g+HyXwaSwROQ3E46CCrxCYVliZiEoe1oX2qw6Lnk
 3ywKbw1+kht8blsZhuzzE/RFjtOdnOlvjJskVxzBBjafqBUKbet0uugJicaCfTqs6QNi6UOH6
 AeeoDuopG4OokGKoexFm9jxXuaPfDvZk3epYRa4R7ojCv8h0t7u+SC7BvfhWltrAQs62p5eXG
 Cnn8ig7kBzSimkxFp1jyWFr+Bq/nZ5m1DNRgTA5ekxD8TYMaz5pCx976LS9K5zizZZlrjr9S8
 kUlFulZu1xaZZ+YFXiIcpy+OnduWcEi1Qq2j7vCJHHCEQW+07fAYScVHTXkehBgoQmvyhojMx
 FU+jwdpiaqbxUS1eE7tDdNBSXPKE82oza4Bf3Fr9v30x+z2pUK7Xg1zopYqHxm+zduFknVGjI
 DOZV9m+4dBPMVAHCirfKcaeQgswcwbRufEE0PwMMjHLpzW61Jy/mtOfm6mh5O9r/x9m0UCwaf
 5fbj90EiRrM7lSq0za9LdVTCqC1SxEy6MhOkv7aO3tU/v2xHCKOIgIM0wu+E2irOSaYTBX6Z+
 Hl0LnV/OL+cRA7l3I9lEfH7mtjNz0FK5KsLUs5LFM4+7TXjEwro/iJ5DwjSNMa5viE3uDh9TQ
 96Mlid/SRFAh0yRzBjRROKEeCv3Xmy7h5vS2r+suq6pNVv6VFDHpu5v9LbWfjfun/y9QD/f+c
 WS0w4CW2HX4D7erJrPCB36nh0pPdl5ljhHCozdVPSTEEIjrddSpvnWyQeavxn0R5VE5ir5Bpw
 yYErgMkDtPjmH5/N9Wz8S+J3SNrq+gJcu99diwET07EVb2Yj3FnBykI9TaJ8NOO7BwawHdsvD
 FVRPJ9lWkfSh3CetTbxsPMwnyNYo+wmkSZKc8rU970aoPgCOPbk2cab4Y6/jdPKhw1MNsVRl4
 6alrvn7qsaut25zUXfKBPlhhNX86uTpB+8QNSg9pX/Oee30wJQv5Gfgw7H57PAegPw/1NCZyo
 +2fQ8NQp1Q44o0chNNK8T35YhOJLN8+HxfGKULwlUuH2ulMbvjsGsBDJ31zPvCIYOWV5EqC1I
 h0QDl3RUCea285jjNFt+LVJvAhDxp5WFYZ4MQWYkwef42bPorQ5x3FdHr1vERslrNsJ6n78nn
 TpIxiq7KvWyU/bbHrIDcOHwgd3bfEz0gVT8obDVgeWWuGVz35F1/SH/6QwpycvDxC0VD4l7Uz
 8Zq08P70EYjRHKjKHYPdRlqWwi4YDZNabg/5i6hwzyHMQ88HXOtwyLML8qfVs9JbXNTtlGXPm
 WBFE7DsPL4vX4zsVm4pqL1Us5EX06qtOvgqyiWsRb+rAToYwohpZJcOFstHO3OgZnVxBW2bIH
 1HbfqTsUL9bJb7cR9irN/VUBSz/erBlmRTM8nTF+2t2cNuD6zy8vwatsmACu+JM4MmquRQzhN
 AJQednSX/kLXvfIqGsh3/wCTp3NrSrvKzNZ3VFyML4/buM0BK1dIg1XNnwCww/scdPajJEGNr
 UQtNysmLnnKkIFeVWJzExobU4NSTduzqypelq8NFF+2UKvU33/kIpKYfUyWoCPOVd+8nrrsP3
 nxUxiBVueKvT08rCSiy/xg1WCwmWK8h1rThsOCYL8lHGaeSQKyyWVRJI8Twvbl1L0yKaTnY8b
 gY81Ov21SSLB6rGMoWWgV5JWTsS8u4NMcv2vsDO1deaWLOPXcbWHKDK7O3sv4gTnDajiPNTnC
 LQhzHvSgTtm30mNsiKDO32eaSYgJpJSBC/RMjHkZzxDNqbaACNaOUIjPLxe8ty9zOOM3pYWtP
 gU7hi4RsXlz96EYYL5pNGhUXkg5u2ZELfojNc9Eo2MNJoDPoOrB3LyZoi5CIOQ8TxcWmXW5i9
 O/7LTFvWq7ixIrkt2zBGPDMCVPmZuD47/yXQhLiP3OMVpj66x09K3vCARM+bv0uPDbBZiM1Sj
 DzHjyVyiDTxs6d6TKBUcf4J0mxjuPDv13XGSiYFkNCbUwFkVbv6WqmYBqJSbcajSH9MvKFrr1
 8pTrGYG9jd/ugn5lP/5IC3uXEGvHOEtrKEDNqEo5j/FHQSPXG35J5vr9nAGM1sZUdmnSQvDyj
 DVU/At+f9g749mSXxsZHslI7Zc/+SeYEcRpUQ9rnM7gaO4P5pQyXqLHB5nr6vGuSiCaHnbtJS
 97E/bwfldwuKVBbPi2aTSES029BhQ0/a02sH3GlaTrLN9KOiEwcMXabA6BjFXNIEeLFzlzQtf
 ZXDAcSqDj7Lyf2U6KrSAUwM/WPRxH/R5C4gbcXriDSrkjHyWWvL+1GAMKZ6EGvawqIdrVHdzR
 xdbUr9k/IZ/8DrhWixlKueaSgTc549h9L4eBR3xmtbq+wSDLBBWIUe5WvY9bAxzv657EZULhc
 ZmqsWqlkZZTqmfIup9tFPDY/XhMIJDeql6TrxVFY2QF5+Dakg8TvAIB/APhc0AjvsJ/Xi6Ur6
 weckocJ7YMMDTGKc2HrQWfgX0z6nqtJHUnhehaRbPp24y8UaBJfvgMkOvT8rmz5GvPvo8j7DU
 a3Y5jSTcO1ltdnQSZu4av7pEnZ2thTPjU/IU5vEkNn0fHibxDAsnjM8DaxyHxeZCz2TtnK5JS
 3OX9fjhvQg24XTIXYUZwgzenq6c1HL6/7l6Q0jDb4AeA0zxoFBXgwqAKTDwxFlg64q82KJPSf
 3ktZ7Y54FoNtxIPq+IlljWYoJaQzuSIIq0w9wCAWRsa0ONt5xOAh6xE6m0rw8vnx7RKAwGlK1
 0aVJXQezZomEgvxDd5C7o17uT1Xi7FmhfQukCz0Sk43qIdBv3zSmzCU/v9f1aTT1mDubjVQKy
 ZbaRsNxuC6KY5iIGsz44euTByWTIypPnkeNtyFMgZWeYaaZEC/iEdx1qRjFF3peIvV7a/bGlJ
 rzYcf8eNC1w34/5Uuy+ht1DrU8SeKzXHUgDlAso1xMEP5Ez/UicPrSW6n7Uls9TurZ4d/jhFm
 qIJeZf+tmOluGBtVJKbMYDM3lG8No+GgITuf309djOiN4cFPBs2FkUYfRslhCP/YeQnoc/aXI
 f2kx5YwSuNKUITXEZ5ZiMqUdpvQ/F7mTDtkb8w9XPN319C/dQXboC+H2U9yNRAQy33Kf7G9kI
 QRMl0TUhQNOvrkZz4GwvV2bJBpC1Jf8eVQWtYzI4497DVAnXQvMuw4iglKo8OWxnmYEZ69QXu
 9zAbAI8tABYAGIkJSl7Dq6LnV2IymQy6/P2zXdRCS/7grWzwdB9LrB+JpoDst89WZ4ZnCSjGv
 qRh2FwXJhAJW4m3jx+CHcEr0xuNWTZvoMzOWCgFrEo50nwsM/3E/taoO8MDXKHYfizIGQNHOM
 GVdlGdFeSL0PkJnNImWQXQriInIXoULfyd8Rf3/93SjIf489ytaGrtshXv2wvdCW2z8uk0t3f
 wLu78axonkGdEKClUcNcoW64L78jHhoJzkSRzkEqNgNkB6G4/Eb1r2mPmLELSS/azD33pC1iS
 nT3WHvYmqqWx8BDraeDXpxCJavXtOQnYnFa7vPOhCxLLJinnCWsr2NyA++9xcRAMRBAIO76LW
 36qZVGCJ6SGI1Ojob6OLgNKjRlK+cq0L0J52yKc1MszcIJgI/U9qG2kE7ypv9PdAOafS2xYD/
 sAax/ZGtsbLgrFKQ5v4Xj/Svgi+tZw6Hokw41H0SLF6g5W1RyMcwRWcZ1mS2NKAfFQ5RhrQJS
 MnNEZClu9UwufhXuff23/o3Zm+DToABB/C0F87rz4ArA/ylqqusl6rzBpNkdnStVIbrq8h1va
 fJUmFCSwVovfciNVIX4FFOPYeBetz2d4bh20+/g46QNkgn/RrfWdu/ipcUkMZm+Ve3+u+iTiQ
 OOZgnjMvxeIgde1/BjJgGkHG8vE7b2159iFdRZ5ew0bx9snIR2E7HOgQmCG8TPAWxH2XH4tss
 DU+hRdywzD9elVJaW/UWwSmiC5ydPAdKixJ+eRgFxUexe7fJjSzNyTgZTw/6hi/6M7Lo9cf9T
 DV/WjeEoQkPFt8dPMZxtkcHlC03sH8/n30Ouo0si1KAYkgM/nM/ny2fgMaGfkXOGS1AW1/81E
 CmPAqr+k11U0g=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Nov 2026 09:16:47 +0100

Reuse existing functionality from devm_clk_get_optional_enabled()
instead of keeping duplicate source code.
Clean up disable_unprepare() at error handling path and dw_remove().

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V3:
Frank Li preferred another wording variation for the change description.

V2:
Andy Shevchenko and Frank Li requested further adjustments according to
the proposed changes.


 drivers/dma/dw/platform.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 7e76391475ac..13c44ee5e047 100644
=2D-- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
=20
 	data->chip =3D chip;
=20
-	chip->clk =3D devm_clk_get_optional(chip->dev, "hclk");
+	chip->clk =3D devm_clk_get_optional_enabled(chip->dev, "hclk");
 	if (IS_ERR(chip->clk))
 		return PTR_ERR(chip->clk);
-	ret =3D clk_prepare_enable(chip->clk);
-	if (ret)
-		return ret;
=20
 	pm_runtime_enable(&pdev->dev);
=20
@@ -87,7 +84,6 @@ static int dw_probe(struct platform_device *pdev)
=20
 err_dw_dma_probe:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(chip->clk);
 	return ret;
 }
=20
@@ -106,7 +102,6 @@ static void dw_remove(struct platform_device *pdev)
 		dev_warn(chip->dev, "can't remove device properly: %d\n", ret);
=20
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(chip->clk);
 }
=20
 static void dw_shutdown(struct platform_device *pdev)
=2D-=20
2.56.1

