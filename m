Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111514;
	b=4mfo0YRBfiiilXwl/U/YNHEdWbiph3N2YK8baHYFCz+SqdCcUJdwYbX65l6ErAgBQg4v
	 FkAfFPi+0fMyY4YjJDyma/MvdQTRJ8SsvUCjHvUL7ORKrO5QbL+vlW3O3PFrdtr2+h1R6
	 Z04vqg1p5oeZFEs136hMhD0AKjy964XSR/dyzYgYG4XmkxtVL3Qcmxp1E6/Dx7g+2VJUT
	 YnOJRr/OXMuN/FoHIoN9zCFU1uji1NLtT2upfblcIuaNtCHkpnkx9nxLBvd3/SI/HJKM2
	 PpaSbJpdCHIW3ifHo9udWFy39+7ADw/7Wt4TBwtOQ9Bf+3a8+xzsMQ5mvgeYU2+GTyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
	b=r3qESIKM3hdpip+OtrpKew7WHiPkuD2amVjkY9iog0vN4RUb9urr7oudE5vIT8B3Iuk8
	 n4lY/IHxu1BrYhQNPYJVFC4Tavmiw96M6rjrT0ghr8fMgrOmRYpBe2AxUxgF26Fy7ECbN
	 xX+Efj8gv4MNdmfmssS1cB7Q7+blV0zQ51TKMTcnn64N1UXafQkwOGfoqV/AKzIHCNVxQ
	 0nHLD5BONYvmtKY5065KSaPzpiv9ac+w7hE+9Nm8SCWQFfE8kptdBkFMyL6bzeHL6rdHJ
	 ahKvNgPJeSEP4AEDpPBMhgFnSvOBBO6ktd6CucyuutEUDOkg2GUIF00WRjkYiyKL9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i+rtoxO0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDFQzwcs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B670C606A336
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B670C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i+rtoxO0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDFQzwcs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo0ZP2344167
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 14:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=; b=i+rtoxO0Noy20qKm
	uYJ5YCbW+8Se7Z5KqAT+4MTHNH7Tk5vnE+7P6LhYkSFvvWTwpU2OMlZhuyekZWkM
	MdePTZiVPh0iXmOWlx3tfH6tCdqcZCr45Y5I6vNFMQkFdHMucSNsjajaCSXDe5uA
	0BLEd9gHtBOWQH8CsEpx8uzBl21U2QcSAg8NqTqbrtjND5KjrzTWnyQtIJbQvwpb
	tt52HCsZd5gqChQeQLy6RIvtWiNvooN0NhzvA+RvOZlVgZiLh1+EMwcjlw4zz7a+
	EnAJJVZpPtJcFKKkeDGujrHGXSVVO6cZjiRLxo8liKqrd5HUH/G6vqw55CNKZG5D
	8qXoSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69c1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 14:31:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e941532594so46726995ad.3
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793111506; x=1793716306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
        b=FDFQzwcsVN+VQyVMwEc0zOwbZJJmVWYg0F7b2ToVFIY4g0BPtv7kdNxAjtiStWJMV+
         Y3ZQsG0Vg3FKcICRWK3D3qCxZWjUAI5hhI/BGIYTM4Pf4xz/o3x5LiZLoEBY9NDn08Tr
         WBdQwvJwTIi/qmBHG6FZRWK/W7B89d0IM28Z+DZhb15BCrzKaDQtOVxaKmZdaPZCg9Xj
         fVVISTWl28PEocWpF1EqGbNNSHLMawIqgHdBkD3KUT8AAkU8Jmu3AHOtkIJj9/NF4KVy
         YJLogtJPJ3R/ypf+GIzycEc9uoWTB/jhgsvTuCT7xwsaxD6y7R2eeIAwUIOR9KUuorfl
         nH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111506; x=1793716306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
        b=u79O5DrS9IqWYGd+QlxmlLMEbpmjTcubeXeMQejbLPDWV4W/J7ZFKgU1wYG5RJdyId
         bVbS8CbDPCo3uaT0N/NUslNciMjRNqGTfMA3XdpKFimfwOW3RTZEmaoP93r+vk9PXQiz
         OqkyFBJ5/vGlf1cmoW6GLVrk577PGJ6IH3AwcfabrCgF3OlsdXmoNPhVqNw7UZ9/DslO
         iirqD/6AfEBt4Fm0fX1ZqUi9du1WMx1wlY9oiIIRWZTzekAFBXcwsLjbBGCsqAh/BISL
         yodpxWC1rqcowAWL4ttWnaDfEyugHdOAmazBqIl9FRdN4gVuKtF2O+Vba9kKGFWssOAR
         JVpA==
X-Forwarded-Encrypted: i=1; AKwUvBywNjqiCdoneVraE90EjYzw1LUueQpHBcNljDIKQ+WcgOKY1Gb/Y+0bH/g9JZZvAeW0EGkoDYVJs+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6xjJPxz9zE0TmP729LlEAC8p0yXwNNdXdv2AwqZqMaxTV5S/8
	LilTE8/1uZLNFdw6hgbtbCwHKMD3RxYTseQyX4pc2xrLhO5wUU7bls+Wzw6/CkG7fj2HCtc8QM3
	zt18rK73GLV/MVR5dJz5Dd5ad2HXKdHVUT89XakvffP7YEL0426klyozrO/VkASc=
X-Gm-Gg: AYBFou2vx6yYICVMcxTWmlAbA8UB/aIpjgp3c14lFF7yMa2cWZMXFyaWNHzVxvEcT1P
	cC0d7Fw1ugG8jD0rBbjU3mOBHCfRl46Ol5jMumzt9A5FKkDZVgAFnd6SpX3GNK85NeeXJJMTLoN
	58YKaA9hEQZpGQK38PDE2kPkQ/dXP+WwVlbMwOTzAe6b3ntVpWvYZzZpYKC6H63jDrlEd5G09Sp
	0DKb2Yr79BHvmgYtZtsRzr+gvRjD+RKtXt2qacc+FcEZmfy1va4H1aSa024XYkwqtn8NcfZEqsg
	SR7Ouorumftgh2EeUpkpVE39Dd7wdqxHd5Un3qTKLS09NbHvZ1uHdJEfHJqmaMuthlOH6rCnrzd
	vtRlYt/6JCKKHS9Q3fYyuprXPo9+zg1Hw6MgWjtihzR8Q7D020ciyGiKIR34+gjF7JNa0iCPqxc
	V9dHMu5Q==
X-Received: by 2002:a17:902:ea12:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2ea9c68c8b1mr90167155ad.15.1793111506173;
        Tue, 27 Oct 2026 07:31:46 -0700 (PDT)
X-Received: by 2002:a17:902:ea12:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2ea9c68c8b1mr90166425ad.15.1793111504651;
        Tue, 27 Oct 2026 07:31:44 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6454a29sm10749995ad.9.2026.10.27.07.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:31:44 -0700 (PDT)
Message-ID: <b88efeae-6041-4189-a559-a16be07450bc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 20:01:39 +0530
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
Subject: Re: [PATCH v3 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0b5d3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ee05V1XPiC3bpTzN_coA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kyHTfHhOAfGJ2PbxmRoDL16SGf0DVD03
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX6N7ZkiBzgSJX
 9r0kTZaAeT/JrD3ImUUZqa3jY43Znaz9NGaT4zL4f+iVj1MifPt0jhj21QPkTEl7P5Naqe0oZnT
 IzC/QvzRuhazjUAtd4oAfc9D87l8i+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfXxS/cv2GPQnoI
 RHPkht6OPTjRjgdkPCwvpLp//H6gt8eKpKM+pHlrqXhoSAu5NNP00tceOaNJbZ9oX573qsgWRHh
 bLXfLNPaS1pQgtVLO1tFvQcniPsV5SzunRvzyu3aY6JQLLEBz+MaqXGYmF1Msy0ZP/cK5TgvVbH
 m24FzZpP1tEq8n9IbVRnX/w0vG1eh6WOHtvTit4n7Tnk2aof9EQvu72QGCpgVl4juBipU7zxb7W
 jK3E1PLqbRZ6Dn4a6/EkIZg4H2Ty7hE3dKkA/fi2tTrHLWS8ZtgJZoAUw1m9DNGc3sysfOd1roz
 V4le3fAISq25OF1sTT/jhsasVtQTlOZNgLKGV7Vbm6JtuSwMCtJjx2arLLUDOhjgMcajpjWEama
 UO9rfJZIO6yalsjmsszATnIHj3NYLxXWo2KtGXuFgeHrPJjCOMRMImJKcTwc1itu9LD0s5fWxDP
 gD6HjvYHZk6u9u1IWDA==
X-Proofpoint-ORIG-GUID: kyHTfHhOAfGJ2PbxmRoDL16SGf0DVD03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270057



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]

> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum i2c_op cmd)
> +{
> +	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> +	struct dma_async_tx_descriptor *desc;
> +	struct gpi_i2c_config peripheral = {};
> +	struct dma_slave_config config = {};
> +	unsigned long time_left;
> +	unsigned long flags;
> +	dma_cookie_t cookie;
> +	int ret;
> +
> +	config.peripheral_config = &peripheral;
> +	config.peripheral_size = sizeof(peripheral);
> +
> +	peripheral.set_config  = 1;
> +	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
> +	peripheral.cycle_count = itr->t_cycle_cnt;
> +	peripheral.high_count  = itr->t_high_cnt;
> +	peripheral.low_count   = itr->t_low_cnt;
> +	peripheral.clk_div     = itr->clk_div;
> +	peripheral.op          = cmd;
> +
> +	ret = dmaengine_slave_config(gi2c->tx_c, &config);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "dma config error %d for bus cmd %u\n", ret, cmd);
> +		return ret;
> +	}
> +
> +	desc = dmaengine_prep_slave_single(gi2c->tx_c, 0, 0, DMA_MEM_TO_DEV,
> +					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> +	if (!desc)
> +		return -EIO;
> +
> +	desc->callback_result = i2c_gpi_cb_result;
> +	desc->callback_param = gi2c;
> +
> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie))
> +		return -EIO;

Rather capture ret and return it if it's an error ?

> +
> +	/*
> +	 * cur and err are shared with geni_i2c_irq() and the GPI callback
> +	 * i2c_gpi_cb_result(); both write err (the IRQ handler under
> +	 * gi2c->lock). Reset them under the lock before issuing the transfer.
> +	 */
> +	spin_lock_irqsave(&gi2c->lock, flags);
> +	gi2c->cur = NULL;
> +	gi2c->err = 0;
> +	spin_unlock_irqrestore(&gi2c->lock, flags);
> +	reinit_completion(&gi2c->done);
Safe to init before dmaengine_submit().> + 
dma_async_issue_pending(gi2c->tx_c);
> +
> +	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", cmd);
> +		ret = dmaengine_terminate_sync(gi2c->tx_c);
> +		if (ret)
> +			dev_err(gi2c->se.dev, "DMA termination failed for bus cmd %u: %d\n",
> +				cmd, ret);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return gi2c->err;
> +}
> +[...]
