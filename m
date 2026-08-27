Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC047DD4D
	for <dmaengine@vger.kernel.org>; Thu, 27 Aug 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787858810; cv=none; b=AeKVs4af6bPcDB8LmSfv6leu3Jz0hlWdSUC6bKXBOAvqSTpaCCpkcxXtYAqjwOVVBlo8tr0PSWqguXFr1/DcH5eKL1LkoGRz67OY+V6LXL7II44NjufEu2WLq5eTw4Cdp1RexAGXS25JaKdUqtce3fnJVh/xsHE0YJu9tlvqddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787858810; c=relaxed/simple;
	bh=YC79HeWvnLoyma6IwIqP+gAXtzxEjRgm2akZa7/5MNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RO6E6FyH8FWvtfDgOntOCMlaoziaGq2MfOW5BlxongzKfZXKsTWP7mvnqjrNf8/kaaf+dfyCGE7486tFUapwjzHTf71oEA60oOqmuzwpUjraWB73LudjH/Dp20knnj7xOVnSsH4YRfKjkYnJ5PTWnk0hfI3vB4uShStILrSEOmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvhnjjUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L24IK5Zx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvhnjjUA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L24IK5Zx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJLfJQ779046
	for <dmaengine@vger.kernel.org>; Thu, 27 Aug 2026 19:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZ9jZYAushPEfiwAksE6M7BwCZChPUs7hwDd556RB3M=; b=FvhnjjUATfdF579N
	DrGSEAZdxxuvKjN/4tiaZ8kpRi8jp8z7lnofCPTJCV3d66DZxmLXN5kzDYn3NLHi
	Qz+5tF/n0FjP5Ka5S2Z5/aD7c3lEele00Q97nTofIGj0XN5NZGA0Z940NUdu+gPo
	NiuPkF9i01Wqp0xKt2NP0SLQRKKVQMEX/nToDLmSZtnstriWtgzjzBMafmXMSwmj
	aVr/t1gaRXbam3caYio3Xv6Q1eV47Ao8UdYTAtai3uJpLqPgfuTEtB6Z0ULbX6DX
	k0tTMQQYLD66WjL2V5SmZoyNCpPSzMczVhbd6tHcQUIgqmZj8ycZUSOoi+yVjF4y
	XQCL8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee11fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 27 Aug 2026 19:26:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso342263a91.3
        for <dmaengine@vger.kernel.org>; Thu, 27 Aug 2026 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787858806; x=1788463606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZ9jZYAushPEfiwAksE6M7BwCZChPUs7hwDd556RB3M=;
        b=L24IK5Zxx1ANDnc2t1LNhAFCxUcoSy+mT7n5KHZ5rw9qWBw30uWZzdTN84tqLyKEch
         +heManH+5cnsuErD50GgsRPcaXOcWpZ8XhxsW00nYIODcZ19q4BA5fOBephYEATvzfN9
         C9MF9cXI/Mg/VYiRvAKyUgNGUKM1F8cPek0/+t6c3v278eYn2zSiteHTCRlZ/FE6L9l1
         t1fq/VHxdB5DKBYoSor52LNlBSM1t3V88UGDKFJufws+ScTWka6uX/+PjkRf5iRktOPB
         5hcHF4OQwxU6ViZnI4O7gAk9aIua0+sTr1n0RoLYxIPbm0OQovc3f/XgYZ3i+0eya3LN
         UaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787858806; x=1788463606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZ9jZYAushPEfiwAksE6M7BwCZChPUs7hwDd556RB3M=;
        b=fV9jWSOda8d5hRvf7n3h7AqYW2rNMR0UJKMsgkpDkbCLhNIuS8CJuuecvcTHrH5gw0
         WlXpbU4oLI6JZaR4bvUDhzGuOBKSoq5i1tmd41XalOg6ZCapZtLfLJm0I6Lo77kvixn4
         JOUNiCL7c3VxSJI/dbBR9t++M89WRnto/m1utC8B89r/SGjMlLlE1RL+ZXfbTz04r82l
         vCrpbYuWKykbgYMEapLzLp9j3OcQLc+rx/MLBYcY7klP8smOzWTo/mv89aoEfcg/dn/z
         YIHxF2RRgkZNF7VGjCK/uawpnwFmjWPqH81SqsZV6P/0gpyA2A2LJ4+SfR/HRNve7Ykz
         cDzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm6ZkBKTubJoHw4wq+lIbpfNz+C1O54/UXsOZRPFZROtc+qIRXzxaiycZarHBdRX0FPRdrpcGvFro=@vger.kernel.org
X-Gm-Message-State: AFuF++mZrGRQYoqSVi+dJ459hVM1GgpirkDgtoQ9l/OmpIXHWv3RDIoT
	rpao+bsmvsDKHfS77TpjtR+5Q2wD89QXaj3US5Z/wBinKgZrh3uATqjM8pxmXKIcuRMo1aVo8Br
	fZlEGcCQw4M8f/KDnWQEh5+5MJxD3cl8rmRTx7F4YWQK3rD3n8u8KgECosriE8xY=
X-Gm-Gg: AR+sD11zYJS/IcxD+tka4CsaQKU5Wac7U4YvVnjvwp9zOeNmkn5qbIa4v8DcofEHj0g
	GedYr2XYAZjudW5GgrVjTUrFNR49IKq/BkMPDqj5C2pJFCoJYAtJSNx2IoaGa4BtbtXHu/3WDEe
	+6jkeKBKKDGbObA65L23vdy/f7dZG0GtowRbHLfG1OU4EshR333VS1jxVxYsx6y+9tdNwwQBfV6
	SwtUXdHYcPzKlGUZ6auyUq0fP35wOzGPC/m6vMaUaaCa1Pam1yA+sEXM/qAbb0xp/sPKh1QOrjx
	Reg7/Tpc9cH/VXjcG92j8S9jkOfnBF6pLzdWH0zsgs3ZzcpGEES48jHXOfL+6TflSqV2+4Oe42D
	+4Npm0IddctQYrFERNL3pmc/3doptKer9uQ==
X-Received: by 2002:a17:90b:43:b0:396:673f:fe56 with SMTP id 98e67ed59e1d1-396d0f2dc87mr2778459a91.9.1787858806150;
        Thu, 27 Aug 2026 12:26:46 -0700 (PDT)
X-Received: by 2002:a17:90b:43:b0:396:673f:fe56 with SMTP id 98e67ed59e1d1-396d0f2dc87mr2778361a91.9.1787858805578;
        Thu, 27 Aug 2026 12:26:45 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm33313437eec.5.2026.08.27.12.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 12:26:45 -0700 (PDT)
Message-ID: <f69d4f56-82c7-403e-98b9-f78b79ac5906@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 00:56:41 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE2NCBTYWx0ZWRfX+ZDy89IQyk3U
 yBeKBhUfF1jFuXMHShztgHSy7pVD6W5DsI0gL31Zi1FOYMMajE7wYk5mpgG5owqicGGXtTS1Lps
 Tux97LimPIa+7g8n+qSA1rycpkMW5/thSZy8Z+H8ztKUBEOJVle4/du56Q6Z/uZ4JmTsA/n0lRz
 l5u9hmFRyNQL81xicdcr2eSpYmLx7w4SpZPfMSmhgF+kTZ4aqFOSehluBvcZ2Eveh11ciCMnmz8
 6iwU4gnbk6a4oYgLtvF/hZ8QtYBd28F3yAXf8Zyd5vi8TYZb9d91IYRIN6ENthG2m5oh8zxLdjZ
 7W7CQcoVA95NAeKSVlemrlVVVm3gREvi9XSllSoa8CuJC/yjzlJ6UBKZ5ieox85/Zjk19KPYWbU
 WUqKa4TdoykKLgPBaROicowYMf+vVPCLRG7FfoPHV7cD3KFaqlNfmKvJolMp8MxytqClWwBSzFa
 HCa+0608+xa9UJMRYbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE2NCBTYWx0ZWRfX2CKGtZY8Nuro
 em+CGjCQO+/FXwAlRgL6f43B0ajshqU6GVMVCpsr3J4FaNxIp8fNxTvpNhPEpYi5UtumUBZmdib
 ou7W2YZ/Dgc5YDp4jXRhbpmRaQvn19w=
X-Proofpoint-ORIG-GUID: naUTZea3HglvY1YONvQujqs_DvcDmqBX
X-Proofpoint-GUID: naUTZea3HglvY1YONvQujqs_DvcDmqBX
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a908f76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=n+669z1BX7WhZ/F6bI95gA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cWZROLwJx0uAb0cS5nkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270164



On 8/24/2026 4:55 PM, Jyothi Kumar Seerapu wrote:
> Add support in the Qualcomm GPI (Generic Packet Interface) DMA engine
> to configure I2C High-Speed (HS) mode transfers.
> 
> Introduce support for CONFIG1 Transfer Ring Element (TRE) to convey
> HS-specific timing parameters to the hardware. Define a new
> gpi_i2c_config1 structure containing tcycle_cnt and tlow_cnt fields,
> with default values of 28 and 38 respectively, as required for 3.4 MHz
> HS mode operation.
> 
Little more enhanced -

dmaengine: qcom: gpi: Add I2C High-Speed mode frequency support

Introduce CONFIG1 Transfer Ring Element (TRE) support to program
I2C High-Speed (HS) mode timing parameters through the Qualcomm
GPI DMA engine.

Add a new gpi_i2c_config1 structure containing tcycle_cnt and
tlow_cnt fields. The fields are initialized to the hardware
recommended values of 28 and 38, enabling 3.4 MHz HS-mode I2C
transfers.


> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   drivers/dma/qcom/gpi.c           | 54 +++++++++++++++++++++++++++++++++++-----
>   include/linux/dma/qcom-gpi-dma.h | 28 ++++++++++++++++++++-
>   2 files changed, 75 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af..52a7800ed4f5 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -21,6 +21,7 @@
>   #define TRE_TYPE_IMMEDIATE_DMA	0x11
>   #define TRE_TYPE_GO		0x20
>   #define TRE_TYPE_CONFIG0	0x22
> +#define TRE_TYPE_CONFIG1	0x23
>   
>   /* TRE flags */
>   #define TRE_FLAGS_CHAIN		BIT(0)
> @@ -58,9 +59,14 @@
>   #define TRE_I2C_C0_TX_PACK	BIT(24)
>   #define TRE_I2C_C0_RX_PACK      BIT(25)
>   
> +/* I2C Config1 WD0 */
> +#define TRE_I2C_C1_TLOW		GENMASK(9, 0)
> +#define TRE_I2C_C1_TCYCLE	GENMASK(19, 10)
> +

Not sure why above two not looking aligned by tab

>   /* I2C GO WD0 */
>   #define TRE_I2C_GO_CMD          GENMASK(4, 0)

[...]

>   
> -	/* create the GO tre for Tx */
> -	if (i2c->op == I2C_WRITE) {
> +	/* Create CONFIG1 TRE if requested */
> +	if (i2c->set_config1) {
can we move this set_config1 into else if part of set_config, above ?> 
		tre = &desc->tre[tre_idx];
>   		tre_idx++;
>   
> +		/* CONFIG1 TRE with timing parameters */
> +		tre->dword[0] = u32_encode_bits(i2c->config1.tlow_cnt, TRE_I2C_C1_TLOW);
> +		tre->dword[0] |= u32_encode_bits(i2c->config1.tcycle_cnt, TRE_I2C_C1_TCYCLE);
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG1, TRE_FLAGS_TYPE);
> +		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
> +	}
> +
> +	/* create the GO tre for Tx */
> +	if (i2c->op == I2C_WRITE || i2c->op == I2C_HS_WRITE) {
> +		u8 master_code = 0; /* Default master code for Linux EE */
why for Linux EE ? what else could be ?> +		u32 cmd_opcode;
> +		bool is_hs_mode = false;
> +
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		is_hs_mode = (i2c->op == I2C_HS_WRITE || i2c->op == I2C_HS_READ);
> +
> +		/* Determine the command opcode based on HS mode and multi_msg flag */
Comment is mostly restates the code, would write as -
/* Select HS-mode or standard I2C opcode. */
>   		if (i2c->multi_msg)
> -			tre->dword[0] = u32_encode_bits(I2C_READ, TRE_I2C_GO_CMD);
> +			cmd_opcode = is_hs_mode ? I2C_HS_READ : I2C_READ;
can you add explanation of cmd opcode into commit log too ? That would 
make story describing changes.>   		else
> -			tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
> +			/* I2C HS write vs Regular I2C write */
> +			cmd_opcode = is_hs_mode ? I2C_HS_WRITE : i2c->op;
> +
what if i write as below, will be simplified ?
i2c->op = cmd_opcode ; //OR can store directly into i2c->op.
tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);

> +		tre->dword[0] = u32_encode_bits(cmd_opcode, TRE_I2C_GO_CMD);
> +
> +		if (is_hs_mode)
> +			tre->dword[0] |= u32_encode_bits(master_code, TRE_I2C_GO_MASTER_CODE);
>   
>   		tre->dword[0] |= u32_encode_bits(i2c->addr, TRE_I2C_GO_ADDR);
>   		tre->dword[0] |= u32_encode_bits(i2c->stretch, TRE_I2C_GO_STRETCH);
> @@ -1674,7 +1708,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
>   	}
>   
> -	if (i2c->op == I2C_READ || i2c->multi_msg == false) {
> +	if (i2c->op == I2C_READ || i2c->op == I2C_HS_READ || i2c->multi_msg == false) {
>   		/* create the DMA TRE */
>   		tre = &desc->tre[tre_idx];
>   		tre_idx++;
> @@ -1826,6 +1860,14 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   	if (direction == DMA_DEV_TO_MEM) /* rx */
>   		nr_tre = 1;
>   
> +	/* I2C High-Speed mode sends an extra CONFIG1 TRE ahead of the GO TRE */
> +	if (gchan->protocol == QCOM_GPI_I2C) {
> +		struct gpi_i2c_config *i2c = gchan->config;
> +
> +		if (i2c->set_config1)
> +			nr_tre++;
> +	}
> +
>   	/* calculate # of elements required & available */
>   	nr = gpi_ring_num_elements_avail(ch_ring);
>   	if (nr < nr_tre) {
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 332be28427e4..6e9f09fc109a 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h

[...]

>   
>   /**
> @@ -62,15 +82,19 @@ enum i2c_op {
>    * @high_count: high period of clock
>    * @low_count: low period of clock
>    * @clk_div: source clock divider
> + * @clk_src: serial clock
source clock right ?>    * @addr: i2c bus address
>    * @stretch: stretch the clock at eot
> - * @set_config: set peripheral config
> + * @set_config: set peripheral config (CONFIG0)
> + * @set_config1: set peripheral config1 (CONFIG1)
> + * @config1: I2C HS mode timing configuration (CONFIG1 TRE parameters)
>    * @rx_len: receive length for buffer
>    * @op: i2c cmd
>    * @multi_msg: is part of multi i2c r-w msgs
>    */
>   struct gpi_i2c_config {
>   	u8 set_config;
> +	u8 set_config1;
>   	u8 pack_enable;
>   	u8 cycle_count;
>   	u8 high_count;
> @@ -78,6 +102,8 @@ struct gpi_i2c_config {
>   	u8 addr;
>   	u8 stretch;
>   	u16 clk_div;
> +	u32 clk_src;
> +	struct gpi_i2c_config1 config1;
>   	u32 rx_len;
>   	enum i2c_op op;
>   	bool multi_msg;
> 

