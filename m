Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2263A9611
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981206; cv=none; b=Dwjx1xTy7hygFhoFBUiSo8Q9SPyuqiXcntZ0u2yjEaF8dRyUGyXRsoWMEYvQYlndtswike5uTrS1L/D43Ge0JbbqGoSO/AO3bRlWEtSVgrtvTzccaO77hhJ677GCmu86EVzHpRA9APNviVa4w9r5glbwLbuF4CUFoBWCgewYmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981206; c=relaxed/simple;
	bh=VrH+00iPXFzilbQSp/OlOVbtUbGy1K9mPgMOEwjgBvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpVzOX90aL8LQZVEEvjL/2glTrxxYRNxgu1SJKmYuGnn2HfBZo6b5cKij7tk8qgofSG6h0+SHT3eleBiblsHr9MV5dCj8OJN63bOtqgQsBFyopD1nmyp6XMte3KOBzJyDCGvgUKrcsL4waSs5ZpqyniyFxJxI1AGRLOsMhoo1eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5J7J56O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDnqvfhN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5J7J56O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDnqvfhN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgZMk2687409
	for <dmaengine@vger.kernel.org>; Wed, 9 Sep 2026 19:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MF1vp434/T33eDhqwTtDmkQh
	9Dqky4UNrblzSAUjYFk=; b=F5J7J56ObCks3lNBuHn4iwjTlTxnrp606lpb8XnP
	jSaznjpa6IX4NfFtfD91MZ37HQ/t9wFSwLFoyJIaYJ8MAju9vmVt1QDtYiJSQ5bf
	TFZ+oBEu/bZAfTq6fcJtYpUXBcjNov8V4eJs59pS6nZ+p+WRVPJQpY157FDFRxTo
	2P4UvJkVyzwP1bMCUYi3Ef1h3B0AHqHVIa2Da1QiZMp1DX4BVo9RPL7QC8ki5xVG
	pA1TWpQuO1GBXoizA2ARIFwd5UXuVxXvOhsrfVKnhnwTuniE/M0lnP/L3uG7ivf7
	4EMy/BLVtiB5aEprli83cMTNNrAL+ypvCi1qV7VQSc5kZw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfr7cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 19:13:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so160287241.0
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788981203; x=1789586003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MF1vp434/T33eDhqwTtDmkQh9Dqky4UNrblzSAUjYFk=;
        b=cDnqvfhNR2h8nhvsia7BdFAKgwqqgVTGN/CLtS7YJQAxmUkMeKVG+3jaQOuOUJ4ZAi
         OtWxee9pvsnZB4L0EBCYRF2CS1Kdy3QS5vL5E0IUkMqaZWoeIDxFflkuETuBTSRZ9Eyk
         O2j1jKbqWn0QK99/snTQzXV8cCxZdIpVHttx6XcZ6AsC9Jt1/rnSl3EVUHAvcQeNSoJm
         G4ggCpltk6lErA1VAxCfKptRMw/QUwzJ+sf7LJQmNNzo4KICLSsmOcx5Zn2rLZuVdcKp
         7ksxJFEWgZqzlloquD2BDicZHJhsGjWgM5hx4kmJt6U2dDNaWHI5vJE3aXPA6mjNKDB5
         OqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981203; x=1789586003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MF1vp434/T33eDhqwTtDmkQh9Dqky4UNrblzSAUjYFk=;
        b=LWz7QkfkAOB7/6TXisc7xMfPVtgfs0KWfBBDv8nh+IRg7AtbQjbQVZaqGdLzy4y/X2
         Qvqf0djMmmUymjSsmAuQSquJZDWerNY072vsttYgR4YcNE5FNYVau8VkH3Le4TePDo+C
         HtNYYFMdAt9CJ9jqzjL5qQgxp/5nS263e9DfVR7nOIb5SC3r1n6lzBNbb/vzz/d8BDdh
         4gNqC5Sxelf2HbJ88zhiCKMyjbPLzWHa4/uBsQFNd5SI/n6Zz2XB17R7y5ZPiMXpcht1
         RuIPnnOuQQu6mW9Y7gbA2vAg8QVrVff/5SwS4qERXLVU4wnBmnISmXw/nwuCk10pOTIC
         oeTw==
X-Forwarded-Encrypted: i=1; AKwUvBz5UUcEu11QFrqdbCUPXlA2LxG1OEgaJXvs43mBY6oao/PCnODItp2uu1H0it2kQJ4uzKd59v+iRv0=@vger.kernel.org
X-Gm-Message-State: AFuF++kvrk9j6btpKjQK9325kXw5vC7hKB6HBsf/ATDwJXb1s6DRJ7CS
	sDRuejhMl1NTr4XKVJb7jAndO6N1AxrOJKi7pA8EIwQo5dNEszVDeixjW2NYyWMtZyOiYXz0FAR
	y774JjakSzNhzPir26Gw5uB9zA33/aVKnyZZaMss3He5LrZ9m0AYrqVtCMsldj7Y=
X-Gm-Gg: AYBFou0kjLkvVpzM8ju/600WRaR23yFilvgCXnvU8X5D4TsHLFi08ykRQ+MDIHF+9Ea
	37em/BgJlRC91h+J8LowWU9zbEnL287gKUod1io6P8MZUU7uo/DHC/v5AaHJZ95UmdBaPrHAA45
	9bIUlSLFNemOO+Q0LNnnQeruL+MtnhUKQvqoSKvE5tlLd7U0eDocgMS2I05VEQ5EZVMmhF1V4t0
	bpj9m1cplckQCIMgiC5dDnLmUhcvxC774QFloP6Ed1kNsVvgwEmRHQizqJwoHQR66bBqlbbktKm
	yJZddwmHaUDRWMi7ob4IFMFLhAs7DeQ1M8NEF37RUqmfi08O2jgDGEH0JerOtgpLxs3aGGPI7c8
	PtIrdZRzkvPgwLl25rE3VJQuQjDeGpFqgu2sQgdxLSF+6Jjn5ZnECZexhXR+XY+A47bMwd3JTJk
	TSiMKGL7IaQ+e8
X-Received: by 2002:a05:6102:a06:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-790dabbf9dcmr241398137.15.1788981203127;
        Wed, 09 Sep 2026 12:13:23 -0700 (PDT)
X-Received: by 2002:a05:6102:a06:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-790dabbf9dcmr241378137.15.1788981202584;
        Wed, 09 Sep 2026 12:13:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74f2ec6f6sm3198485e87.44.2026.09.09.12.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:13:20 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:13:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org,
        andi.shyti@kernel.org, mukesh.savaliya@oss.qualcomm.com,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: Set IEOB on linked I2C GO TRE to
 retire TX descriptor
Message-ID: <gibyui67mjkf6fxgodg2uzwyiio6d75boien64f2fpfjpkvwno@jtmsqwh6zmzx>
References: <20260909175332.304767-1-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909175332.304767-1-sevanevorotov29@gmail.com>
X-Proofpoint-GUID: YupL9TDI_QmjHKmW7cSAV9GhH6qfNPf0
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa1afd3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=7ZfXIp-WeeTcKSKqBWEA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: YupL9TDI_QmjHKmW7cSAV9GhH6qfNPf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfX6qsZxspnVn6L
 EwOmLzOZcsAqWHjiXEMh5PT+4jdkfjKXOT68qPhIH9LFHJQsnP81y5KyLQwS7gRf6wZ2DUjwhfh
 UNJInTv4LidXGVOZwhlbSmUgNSWEDsMB+OcYhiB3rjHd4MGQqmFtFivl1QTgucNB7vZBgTZWJxq
 fv5lRm3F1sI64YgAYuodAoQDaHbs540znd0V8jWbrwQNh9+zWlETHgJpDIEXtuwmYlC59c8qVnm
 h22ZesefqRvFtWAaVkhVkX691L292Gho2h6yPMEGH7WuN72NCHc0CSiZ5WvAOWfygWFfzOZWANM
 Y1gW6nu0muJWt11z1YkVm+BwZ3tBm7PgPUIztk1LdAYP4uZpqjBOQIBo1NLSjwC3z4U5M4Stsvt
 7hkEBY3hd25lJPwj1sEDkla76Hu7wswZuy4+Kyl2C4MxjWgMfHIpakbor7qn/ZI6yWGJO3R+eY1
 qCPumASuVMln8gqH/sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfX5m7UXJlrYyON
 +4yvy8ZwJPtQMxqIj3W3hbxFersWFryRPFRiL+1qTRLC0nxVVI39WUXTb7Re9xbQlx6UMIeq4Ng
 ld3fCyI8rCIrS3RkYboJ2bz1uvYKk4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090213

On Thu, Sep 10, 2026 at 12:53:32AM +0700, Vsevolod Nevorotov wrote:
> In GPI mode, an I2C read transaction consists of a command phase on the
> TX channel (issuing CONFIG0 and GO TREs) linked to a data phase on the RX
> channel (issuing the DMA TRE to receive data).
> 
> Commit 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single
> read message in GPI mode") avoided programming a dummy TX DMA TRE for read
> messages, leaving only the GO TRE on the TX channel with the TRE_FLAGS_LINK
> flag set.
> 
> However, gpi_create_i2c_tre() did not set TRE_FLAGS_IEOB (Interrupt on End
> of Block) on the linked GO TRE. Because no TRE on the TX channel has an
> interrupt flag set, GSI hardware never generates a completion event on
> the TX channel when the GO command finishes. As a result, the TX transfer
> ring read pointer is never advanced and TX descriptors are never retired.
> 
> Under sustained or high-frequency traffic (such as touchscreen controllers
> operating at 120-240 Hz), the TX transfer ring quickly runs out of slots:
>   gpi 900000.dma-controller: not enough space in ring, avail:1 required:3
>   geni_i2c 990000.i2c: prep_slave_sg failed
>   geni_i2c 990000.i2c: GPI transfer failed: -5
> 
> Fix this properly by setting TRE_FLAGS_IEOB on the GO TRE when multi_msg
> is true (matching Qualcomm's hardware specification and the existing SPI
> implementation in gpi_create_spi_tre). When the hardware finishes executing
> the GO command block, it generates an MSM_GPI_TCE_EOB event on the TX
> channel. In gpi_process_xfer_compl_event(), handle MSM_GPI_TCE_EOB for
> linked I2C command descriptors without a subsequent TX DMA TRE by
> retiring the descriptor and updating the cookie without invoking the
> client callback, allowing the linked RX channel's DMA completion
> (MSM_GPI_TCE_EOT) to signal final transfer completion to the client.
> Other EOB events fall through to the default transfer completion path.
> 
> Fixes: 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode")
> Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
> ---
>  drivers/dma/qcom/gpi.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
