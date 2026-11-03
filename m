Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702680;
	b=WnZFtksNpG/5Y/PYWzngFEo9lSkZuhxYsud4xB3iBz4wnCAXFdgK9NZGqBi59ZPht7Ne
	 HAh4Jfd9CWojkCVC3MLYMU78YDv0ruYfsIdSLYdlbNJaPjN9Qp4i1IJZXVuCq0hlg7VHm
	 c1/gsk6kJVXe+TP3Xd6JoYO9ZD1GaFtJ5yJS8rLz6MPLUrVMID7BZC3XWegXsRtIFKuLt
	 9scG8V9ILNeakycUBCG4qgtcQY22lxXi5X6gXsSd8NpMUYf3iX3B10nhHheATGV3Ap6V3
	 40g6kKIruvARPoGXI9AyJ1vRd2NkJpopZnL0yIXJ3ujOZWa5Ab2VSrfBJAnkbc0ivLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
	b=tM0TF7xW82vEWiLNCKLFsPPTACPdMFX6TMego+GmkmKajfFDDDbJJIYqRnhPkQGE5XFn
	 oEbZLWy8w2dCz0Q2MNbDiPAiFQOjEp+EZNzSQrhY7EFBwhkhm62FcMEYn7lDfJ+aU5qFP
	 tZ2hcATmgJNdOxOLJ9MvM6LSizE8X1hepKwKeTVF8iCG24mMZU5rZroM1eeg7QBLvD+9B
	 DyCMDJ2wt+7s2Jwal6oSc0cnTPxWi1VjpSm6z2zvHgiFFtbVpLpnCxDHWplZkaNBlERNb
	 f/VRqPVt83DakMJqorLVDvgI38bI1zk3oqLe2WdkAQPgqqcjH+73BCTj4AzB77n/O7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dv+1M6Y8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZhsBkh9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F2606C584
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 10:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3F2606C584
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dv+1M6Y8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZhsBkh9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAGsh2522052
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 10:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=; b=Dv+1M6Y8oPnp7pGN
	xv3vplmWBRqQZoDov8Gmv2RcoelY6YFKXuIQxjoWRLHxQRybtILGIRPc+TDLzPo9
	YSMSmuBamhxMjvRv1vKDlgpZ9nrfE/X2yvp5+iGFXNl/K/etC+Yu+Rl5FaEQc0Lo
	WV/Ksj/5fDSwIL1boFCAc1jMP7JdmtHzO5Z9pYdz/Gq7b7s7VXF04zaFXLCNJ21j
	euEuz74Gi0UYeH2Lu5V1F3mFLh4mtS7Qq/XjpgZdx6n15FEiVnAmZMc2y5kx2hXi
	9Ex4s7e6uPtpOqwjZ8TMpXbb3/5LhhFlRIsQAHFnCr6hl7eI3kily02PSEvrpHTN
	A2Kg0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5j93f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 10:44:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8dd9b9743so47223515ad.1
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702679; x=1794307479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
        b=eZhsBkh9pZcqiCmMX9B0WtgvFwwrhbXfZBU6W3cpqriBZ6tLVpPSkmOIVSO+5x5w/2
         rEAOEfMAu1vObsDVgXv8h8QZuBcYLq3U799TUROlLQufMEf4ang7fgVc2OzHXBg6d2/q
         XFWAe8Bmcp1edRP5EnoWmWIPDzZ1Pt2hiz0hjLOnD7+tKHrZxoOFf9pgd/p8DbvHQ8wb
         Iy3iunDJBcC0UNK4fmlT5uLB1O121YVAhFvwelnhFOTgbbieXQ3fiM1vs2yqNEmvYJXF
         Gv7ztZ6xGZq7Z61RCMEFU8uNXKZ4tkEChKNZFdjhcaaRSVTyqIsMr2gqrsNJv0juJmK9
         as5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702679; x=1794307479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
        b=lZsE7V1kFKfLAie4VYVKTpAHdTsS+cyl1vsdzGgRZx7t46Ci+z7JoAQonADDZBc8+N
         lLKTEvvrBGSDVuOVXdEkj6pdwG62dCXPWndenNCrig/1mN+SkARRC413gD6/cVm195h8
         nfA3dj1sF7QTbahRbFXHdZoWt+z+wyxpy8uTLCmQp5xv5ZUCP8JoQAsVT9fnjJkSkb1r
         PBDy5Ai4yP5i3fhk0t6HJeEr7t+yemf3eeKQPrWGZfJyef5B35dUjFXV1Ht8N6ZoZPAS
         M2Rn72xuNU5TOl4rPeJUALCKFJLxkNBn4cr3Jcol9eDDV6H0QJQA7QNskqZcdm4bWy/O
         nh/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAvyeLT5BRqBnXZGz7NNZbA+mp4geb1sgpW8Ui+bGqGGs5CADZrWkmcmzpgYuaKKN31Vgc7LKeiMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87zIbQnfIDvB6HoBDt9d8en1pVNMwG6oLK/+SzcVy9xsNEm+ap
	J0xiJz+OQP00Xlw8CnqNJce3p+8Q/04GGEYEv5YITFMUYXxYJFVtM8vvNkkF0dzyX5mV7ADU8Vu
	SqZifJgPWWB4NArOi9Iyqbzy1IblnGSuBqBsgxKfphqED8jm9d+85ZDopSgxIugw=
X-Gm-Gg: AYBFou3JBLcfM6RyDXzr92kel4mWmd9FacYQYGpTqisB1TPI3Ok1SC1DoaZSsZjavHa
	u8Mn7Q+cZcg6eMS8n5XFWbIcirii3KuCoOXJLFBHshBbDT682gLArSLQf04lJG6kWjuqy5L3L8q
	7iIIUwLK5PFDtriblSNRxbtO4m+LbwJQmb/PTU8M4pPh74zhtPvF87/pnM6Iy24shPHWkiK4m1d
	bnYlhVx5H99i/0K1sMbsnCLCQYvkUPtUFsDGUWy2qheCIdTkdAjSIe2pPqnU2S7heBx8iWhiq7s
	+v6p0uTtBiF+Kc6cCbC0ElOtWnahZL/98rGfXKckelV/pyrwzjMzWejvYvccqcq0BemnseNkY26
	QCdOI4YakkzS8HiHASXU2KejV3A5CpETQrTEOkwgEvD2TC4KRqWhJFHAIFCfjOkZedOMUI5fOly
	3rQdZetg==
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr10616880a91.56.1793702678737;
        Tue, 03 Nov 2026 02:44:38 -0800 (PST)
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr10616857a91.56.1793702678102;
        Tue, 03 Nov 2026 02:44:38 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm3905297a91.7.2026.11.03.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:44:37 -0800 (PST)
Message-ID: <2ed54730-75bf-4368-9391-5452d0a31fa9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:14:32 +0530
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
Subject: Re: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n_4MB1KQN3q7Ghjr38uhnFfZOe3E06kG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX7UbAv99laWP0
 0NuPUNccBLpsiO9mLpLSEiGSDPxRwrGtxHd6oMhj6lJc8hsUXNIg0hOrqIWkN/7LO5AW/WF1OhB
 fmKhg2CWgd7aqepH9zPgaxEkRP41R66xziOeUrFAMGyf7RiadBtKImSR3hdOGwCCT10CDovDpev
 ppUtV6CkR5YyR5YM8p26Sv7hjs5yzb/xwU6WzgMJ03UYte2V2tVo/9o93Bu1ocXvBSUy+KKQHK5
 oWclYHWuYqSMHUqF+IPACpIdcJhzg54VUG/Z4Q2F8xohYKdC4gxCuBTYpK1mJvPgv+qSaj0MV/k
 ll8RZW0WDJfeSiRPo6KmLq1vV1krgl89HXBodZbV65NCszCoTyguzUs6wv2FP+EECxb/e6mUK2U
 JpH8O4N/G/P7rDzKAY0QVwtZ00MaYpRnvbEQrleTgsJ80DdNvNTd9O1q+3Bt+Ulx+MxB1CMy7s4
 II8pBkudpUIOZ4YmVzw==
X-Proofpoint-GUID: n_4MB1KQN3q7Ghjr38uhnFfZOe3E06kG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfXxbxlAcjBXpM+
 tO9ILHjcXwiq0WGPK/tOmEz5LciqBUExMI9u+Rgyzw/pxNyBQhf4U/gxYBvwSwZ87M0H88uspA6
 wJ0tiFS0uDcSaw/awVHib68kocirZtA=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9bb17 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ljc_7vWThQ_RCqSD0EwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
> SDA low, leaving the bus stuck and preventing subsequent transactions.
> The GPI completion callback reports a NACK and a genuine bus error
> alike as -EIO, and the existing recovery path switches the SE to FIFO
> mode which is not valid in GPI DMA mode.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
> SDA and SCL are already released. Extend the recovery callback to dispatch
> through the GPI DMA path when gi2c->gpi_mode is set.
> 
> Use the adapter timeout for GPI recovery commands, and preserve the DMA
> configuration error code when GPI setup fails.
> 
> Stop recovery on a GPI command timeout and report DMA termination
> failures. Do not issue another command or override the timeout with a
> bus-idle result, since DMA cleanup may not have completed successfully.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 107 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 94 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c

[...]

> @@ -1356,10 +1439,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (!gi2c->gpi_mode) {
> -		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
> -		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
> -	}
> +	gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
> +	gi2c->adap.bus_recovery_info = &gi2c->rinfo;

I guess one more time this. Why patch 2 is adding and patch 3 is 
removing the change ? keep it clean way.
>   
>   	ret = i2c_add_adapter(&gi2c->adap);
>   	if (ret) {
> 

