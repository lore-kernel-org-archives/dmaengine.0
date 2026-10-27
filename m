Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108100;
	b=jERzfcBHUmsP19ovGFNCzQac2isCgawMEDdVK4e/9mGsOt6pvnHw1LAQXWSGhxkJ2Zyq
	 9bMLqaqSLcaezuB9Vfc/GA3kGJXZwuyLhIVEBivHF4YqgPOsE0nlSxJ0VoR3umfCPqO/A
	 uaYuDV1iS8hQVzkjW22cm1R8TkK76GdW1GCgdqa78GcnAnn0jtIrLmN89iBkfyMFNXcWT
	 c6plF0rQQ3CYJYn10uE82YwugFMR3YwIJDYzzHzQbZJivIG4J7Pq8IBexilQyCtaibvyt
	 Il6pAUp4yzuVyOJ8rzIR1l4o2KE64lGCjGDAdgpFn1z0MteyWnt5rRJEugPw5l1qpxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
	b=l4TAh6QhgOQQHcQdtDPULwggaDA/EhNtQP7hqeZGw4aVyv9ikdF5PxwM+sXqSApY7sEh
	 Z1RPUfzUj9kcux+Dja6o8lD5yFIUejNXd36q7+XAnx7/GEUE5rLQOVnIkf9LEtF7e8Rjh
	 34JrNcJehunO7+01hmaJ2V4i0y+kF2eREO+dZLtTMmUc20EQDQ72t1fmBWFYTVZN4UZKE
	 wmUjaHlF2zz7xGSJn4nmWseFffx0uJgE6Np1rZrWsIpYXSsFPUHFhVvPFESzXfAtz7iTT
	 7I+/xr9BxG2Z3BkNPnmQrgddGD6715LXHxyYy9ypjCapmpLQb4Q+SS3xp2pzu035tYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZc1ObIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKgtLxn0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C4606A31B
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 13:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZc1ObIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKgtLxn0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RCO7jc1124837
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 13:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=; b=VZc1ObIq3VYML8eh
	tRUqcPH7SLsFquAM1/bjN6JN0kOjqUOrYN1f7uZJfTkqBvUrK5bDlwBaLh6xKsvI
	wpwpF2me1hy9+cKf4i8IWqp8GQFKUNRz9HrEzOG1Atw4xQjon9+RWgsqHzfvmCAK
	1C1ZPuc3XNVCOMPr18aOeVQaPElik7kOQCnq3Seaqyx5hlRF5TEsMtI+xD6HQWaM
	7rCxBIg9Z4KDz701Wg+H8j/nlWMGp3P9rkEUPQnhCki2Qt+LvNQFi2ct0WBvt3xn
	QYB6tQJ9yWGltPT27H3/z44lskLhwuH2e6U4gEAcph3HI6N8L+XGPCG9Ik+R4jce
	sEFXwQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9891t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 13:34:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151dcfb1569so653848c88.0
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108095; x=1793712895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
        b=kKgtLxn0gyFEUGNKsxvLyDDqTSPC5z7sFnBKKR9r6iMMsJVz8ZvVaXr85XUZdmmsM7
         kB9P8yV3q7jINgcjjz0d6SyW7Q/UNlR9vlNMoPYWWEq/jD8+4wgHeGd1JSPkeGc9pO6C
         6wVCvhqjeARyCD5ZIaqWkU8nB+n4s8ScuR8OwnbnBA3iiyZx0yXJdGwPKxKv+w62Lwq0
         LzJwD6AAe+Wx45ZeUfeZSE4W6y5xQ2mXcJGflzIL04CwEYpe0olMqvmlMtVf/bvjIZh4
         eo+lc47Ql6QDtx2YIhhh2qYTm6+o8KH+E0U38r/dP6B+FDDfFvj4siinR6JTiacybEh6
         /9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108095; x=1793712895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
        b=TpHOPHljL1vxN7X4GQvzv9Bi3IiVMVp8Co7rO9NsgnHOMaU5UCWRCr+NB7b57lOEOX
         ztKWBC1DVsoYJF4Jp+FbJP50qLBFRy9ww8bBIlWXZnY6/N6K9mPaAu7hOENAz/j3Ylnx
         5KeP1ceWPdcB/3x85qb7YxZ4rGjuUAoWxTBixL14S24eyiE2qVX/iWddC8TNtThs/Ifv
         2+fm6FxU9exQ3/hzZL3gcPK3Gp51JK9kfITwSkVnoWOPsGjmLMuxq+MtW9omy4cWfjqB
         IsboX/HuBJcOZ9bfUN+qqSAQRG87exIyb0XvNzi9AZ26fl6bauU4j9+tVr6SzeFOFPNa
         ozWQ==
X-Forwarded-Encrypted: i=1; AKwUvBygJJ3CRFrUUaHKecEyke/sam5WqhcowOTbl55PpYTEfSBiuvC27+aKpYUmkdy9D1gNAj+yLTbKyjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqgaqPtDT4eIYr0VHU5QhYaTVErC0zsx28r9IwrJXzleC53Ahu
	6HDg9eI69jdZ0oL8wOcv7yXU1xG0/FnShka0z453Zd0KYt2h4PrN0b9Svj3UTIVqU3+kHrSduHH
	39M+Kn+NPRWLub6hEPkF+oqREKV45X2BKsVtYrtiBup7Kg+OE/4LDxNzUVJWGHDM=
X-Gm-Gg: AYBFou1v2Uvkn+7h1NdmB8/PbcCrqoAHyvuzhBdZ65YQUR1u0z4DmIZZQCJA7sLFdyu
	Dm9M/2HmMU7TnVz2ZrB7s8aDBBZN/9wtnPicT/ULjUF2/qoiuT5xf0MZHxqR3xT2Tacst1AKxdq
	k5aZr3/bozDY8zKuwUbkMDrmK5rNbsjdothz8dV0wLMHrRkOuLt/BBu5fxIZW1vPtRDtnQAvt9r
	RQN44ZleYKROIiti836ZNyrR4huU5ohMbK75u0ivtDP4y/9jRM3Kk5eNLzy/6OQge/eiH8WCPdZ
	WaN+APMV0UdRiOI33Uzi+zBZG8PztomOZ7Qcljm3Dass1HJWVEQl6A0/45V+DqYUf/V+zsXsko7
	3iuAXQ5114r8WGEoI15VlH2hpODAGKdEjvA==
X-Received: by 2002:a05:7022:f8c:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1a3cbd717e6mr5335398c88.23.1793108094566;
        Tue, 27 Oct 2026 06:34:54 -0700 (PDT)
X-Received: by 2002:a05:7022:f8c:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1a3cbd717e6mr5335328c88.23.1793108093680;
        Tue, 27 Oct 2026 06:34:53 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm39957140c88.6.2026.10.27.06.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:34:51 -0700 (PDT)
Message-ID: <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:04:47 +0530
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
Subject: Re: [PATCH v3 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0a882 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=lV1k8KV2Q4sVphKZFiYA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: A7vIxyI9Hq6y7sHwVk9gOOZ1oVHy4GzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX0Aqt/0Zs5z3/
 jsehUsBE5SQ+oC4bi8BSLAsWcz11+E+nkdKGhFvcnDEmraiYmrrRdEQ7D+MufKurdRXAaeN1NzB
 fE9jeBYmpvTYllDngMX+YT9+obG6BoqA+7EHyLfPJvkm3sqQ6t0bxyFrtELC6WarPXCN6FCIWLk
 mnokzGgxbrZiS9y9fghnUx15niHSEEGdgo32BZqzq6rGVKQ99PkrvCKbxOVcthIBX87v+L2iiRu
 yueATAb4KUGVYA5xQ3ft7QnUCgxzXsSn8E0nFo08skjRfp4Jdv00BCrP10UrxmcvtoC1z69kSuA
 n/Qv9VFbj0+gQY1y4wJx3t1l76OreuuI7uKhMmuhjT7ClVHmGJhtynja7fYmRa0FMiDwbjg0mNe
 SAxp+bn1IN52+BaEhjNJJci+P3zP415DMg8AAVbD2n/futCQxmYzppBrwJ7T9mlCFFI8AXipwBz
 Xoq7s7R9MLorHuFgOcQ==
X-Proofpoint-GUID: A7vIxyI9Hq6y7sHwVk9gOOZ1oVHy4GzE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX71mWi5QkVokK
 BXQYcn6yP2Ipe4h6N1yuBBlEZEiUzsPhCXFju6pDnXXuU4ofZwdODwPeSF2198fk54S+PRZ0q7o
 Y53dNcWmXI/oPvNt/aNXWOIhd8tZ9BI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270054



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c41bfac65ddf..394e7287f6e9 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[...]

> @@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>   	}
>   
> +log_tre:
>   	for (i = 0; i < tre_idx; i++)
>   		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>   			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   		nr_tre = 2;
>   	if (direction == DMA_DEV_TO_MEM) /* rx */
>   		nr_tre = 1;
> +	/*
> +	 * Recovery opcodes do not require DMA data TREs, only CONFIG
> +	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
> +	 * shared with SPI, verify the channel is I2C before accessing
> +	 * the configuration data.
I think i have mentioned earlier also. gpi_prep_slave_sg() Not only 
shared with spi but rather say, is a common function for all protocols.> 
+	 */
> +	if (gchan->protocol == QCOM_GPI_I2C) {
> +		struct gpi_i2c_config *i2c = gchan->config;
> +
> +		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
> +			nr_tre = set_config ? 2 : 1;
> +	}
>   
>   	/* calculate # of elements required & available */
>   	nr = gpi_ring_num_elements_avail(ch_ring);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
[...]
