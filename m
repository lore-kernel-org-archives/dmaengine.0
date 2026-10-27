Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110087;
	b=QemDn6BHfPgIq93P4pwExDH/s4NoM0yPXB586CdhP0bxcf+LtQfSx0DZY+CGyFtdlb8V
	 OC6dWSc6egZdFi4u/gbohjtFVaRPbV4wWqUyO/GBU6H7FSskRBkmSmei6qMFSMEX7Hp0m
	 w8PW+Xg03vre3FpUahkpsfwICrLvQ8K5vVybuCWsaqwh7a4L0JkljJnRwODlsQDwte9i6
	 867QBn+G3GhJBos1VZIOEqThTiRjf73GP/wJLdZFPLLfwsNepOGdENfZR5bGxRKpFI9lk
	 HUFL5XDzuUtPWkFiHWZXRS35U4g/tJKCU/Ov2CKNJGCSOiCSAzENZaYmX/n7cXmNDHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
	b=YhxWCI41L8qe0OrAkAGKTfKF4rvz+M5Eln9pFlKI3JRWzxR9jMfzbfIgi7Ly9Y1GnN3+
	 yTn0M0vCsp15GM3ElkQKEA1VGCdl0n1tiYXTCA7VHFMgvvaHllh39l8KaLoNtsDql27bd
	 EMs86ABHQLyAA8WP8YNTOgbLoQpd1HPFBsJDaUTLcFwBf6yPTdupCrgBXDEBHkoeqFm5Z
	 SLTifvFThQDcE5A4LsPFEv7mlKG5OkqkUcQf2PIa1jPjFNpYY0oO+0sVWT1KYTYGsrVnZ
	 d2WfSOuUuV190pMiF8X1GIcPhvy1yo9CHrY0gX066paN36Rd00Eho53uv5pJKUPyq6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJyGDv1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGdaW+61;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5D6606A31E
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 14:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJyGDv1k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGdaW+61
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoEes2037000
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 14:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=; b=CJyGDv1kfrczv5x+
	zzdeblWPnV2nNUKN7sdqN6M4N4qEmTYV7S/skWsonIPJw2mtEWnbh53MF/gQHttU
	tVJtu/ehaMmUHUTq+Y1C0VCMfVHt/pbflC27WTzfHK9C+sxvfTMIgthUvVSWkFas
	xvKYTVBOdG9uCNpiB+nrmaMdctJQ/oaVj6zupB8I+saDbwR+sgCwccv/M6WDq6DC
	8gF6HPzAuijyJ6ighWZntHCj3WWB0WMHYHLBx4yuA0eYEHyaQY0ObD8ApJuxeX8O
	OMHMF4KJZ6uuPrPTaczxzvKTKa1+ZVrygUkJjtzpNpGPoIeh0muNwt2w+opoDOGf
	7pHYLQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5sk02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 14:08:05 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67994567a44so6804197d50.0
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793110085; x=1793714885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
        b=PGdaW+61CvtJ6Ew9w9m2fHhLsj4jOqZHtO/F8DVZgYIjIKo6EzOQPDyGM3MrDt8xLv
         KiwOy7+sRI7UEfYamEl4bn/ztsQulvj3b9jOQE6HdfyQNsZ9sBEQOgbGc2eJSW/Eog0p
         nrAa0tP1FXHiXP+zYngQd+Bph7iaeQ9otsoKkD5YmiHvZtqdWzxNcDkN6qNd9nf/z57D
         en4MTJiyb0FI+PCvbT3f0tC67e4KaOcRTqR8SYFCL2Bghr9JUkhvnu7ufZ9TftWhSdyQ
         XVlSqOjdkh6w5qwB4eCClpfeo+fdXDtEiXMQbQuS6R4LqvbxptGwuCnej5pI01iZKlqi
         P23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110085; x=1793714885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
        b=fyk0J7EGk+TrBNXDvVqOhPDo8tiTSylF+MTQXdeOgKaRt6sLYzBLyhLuuakLpPqqd5
         cto7yNbxNAU5ngQXIu1LBNsPvybx17lgMuFdNZfn9Y+S4Gugjg8aCxjmeHTVe6UnKER8
         CUHEbP18M1XwjhyFt5d/Mbod7/trFmHG/walAYTep4LcCUKtzYLH1aUZEl1rEERdMIDd
         BkcEJ1QjjXtwzMT+VkwLmCR2jQI9/338oazsCtR2a3U3q5VxTqO52Ydqh6ZkGI1bwRlM
         P4vjovW2Qe2yfdMrgE4zZmA5lRwuECDja8kQ3umVWIPXcijzrYnzysOisda9YgypiwE4
         wpDw==
X-Forwarded-Encrypted: i=1; AKwUvBzmAMkkX7sN4UAXbc77RiMVKqlDnDrvupGkI0BwB64NGH3KJvW2mvMz72Sz8bJ6P/EURPP9+2GMOf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzT+J9lcW8RbRN4xTGDg6ik5cF30A90pUc0UcpTauB+yv3k/tq
	qINdvlgpv/KPLT4c9eXhk1ZqGOWfu4iyPSaA44UiOhprW2aILX1fZA3P6rNHLQt382ePAqJ4P0t
	2diAj7brFbnom5zqSuwqnABUQjYRx1BpS43+yMMiH0dvuS9INCcMTFfAHZMQtaPo=
X-Gm-Gg: AYBFou2apTBU591q5QPDcT3mbSMhjo68VPG2ED7itiFKPc42jlCycs00gi2+y9mrL1C
	JYgeHrFSl6kVH9T09XIzDHLzNhT5SVGptC6z1knkXXJ7v335ADxuESNBwuyPv52ByMoIib19vI9
	jK27dgGb7p0G9IG5AxgX1n2xwxDhSQVRgD3IXW5WUf9p4wbbDAWWut6+U/Vj2pY+GmGmza6DY+8
	MLtseSMKmxYOP/IK+MKB+Qhlffi0v6NIMKDl/SALqjMYPm3Gj0RuSgHTOxcaKbR+Y5zih/OIMOp
	w91dy8wx6Fo1PbOhK2W0oF2Kj4gzi9nqDJHBhxYik0vnVmx2jnszsTMtcLVTjkAPcWa7hZ5FA8D
	i2vukkq8bE7WWOd20xxP9B0pb5GrwruxFpA==
X-Received: by 2002:a53:ac8f:0:b0:679:a650:a09a with SMTP id 956f58d0204a3-67a45188986mr7162435d50.6.1793110084866;
        Tue, 27 Oct 2026 07:08:04 -0700 (PDT)
X-Received: by 2002:a53:ac8f:0:b0:679:a650:a09a with SMTP id 956f58d0204a3-67a45188986mr7162412d50.6.1793110084117;
        Tue, 27 Oct 2026 07:08:04 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a07e163sm127917d50.8.2026.10.27.07.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:08:03 -0700 (PDT)
Message-ID: <acac5cec-6fa2-4465-9f66-a5e533404978@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:37:57 +0530
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
Subject: Re: [PATCH v3 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfXzfN+RqGh9R5m
 ixRbknSzjOM2WLbXvBk4Kku2k1AEx8wk2d74CRfMes64lWjid/n9HOGwLVWgc2GvI3tM9krq+b6
 0ePIE829CoVWVh4V7YnCzKUdYtYanq4=
X-Proofpoint-ORIG-GUID: Blmf93w8jOQ5rVC6eY2UBLa_1kFbQCNZ
X-Proofpoint-GUID: Blmf93w8jOQ5rVC6eY2UBLa_1kFbQCNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfXxDXFc9FFCuOj
 HIP6HJuVm1lBCv7gETj8eOiY/eLlMrB4r9JBPmZ9biNpFDubxVpteyqG2uObGt1mlmvuYfSSpum
 xpz+bxzV8bC1iJAtbWNT/24M9IyFl5P5Q5OUnwnbfOmj6y6C+zMoJK0x+VHbilyb2IPPK/hltJ9
 6UaV0frEBtk1zyXasPuZOIL0B2p5xlv1NjuwrwcXbtqxRsQp9u5vGPZeLuW8kZfaFCPOQ+BTiL7
 FXWt/MtKcKde6lIO3lYQpjelx58ZW52R+sJRFcYo+6Bh2Rto+dtIhWbd5R/ntBdYNlll/o7+d7U
 DKGV93WbolsPylDwUQnnYRENbyUvBhcdGO94HmBui0HY6gzEym9Z5vJegFupaKZ6t98N1xAaBip
 6oJZkcTPsFZR/5QHF+cGeCmkAtM0+H+mF9YJUVMGNJE1y4DvXmnvVCqnC1MZ9GruDGKJr0468w8
 NqvOo4kqPr9CGfpAETA==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0b045 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qTkQnuk-FKC89O0zAyYA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1011 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270056



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 127 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 60b6273f538c..d9e86f110ae9 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[...]> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> +	u32 ios;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error turning SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi2c->se.dev);
> +		return ret;
> +	}
> +
> +	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error setting clock rate: %d\n",
> +			ret);
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
can use goto , jump there at exit with ret updated.
As 4 times i see pm_runtime_put_autosuspend().> +		return ret;
> +	}
> +
> +	if (geni_i2c_bus_is_free(gi2c)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return 0;
> +	}
> +
> +	/* Bus clear cannot recover a target holding SCL low. */
> +	ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
> +	if (!(ios & IO2_DATA_IN)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return -EBUSY;
> +	}
> +
> +	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
> +	if (!ret)
> +		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
> +
> +	/*
> +	 * Recovery succeeds only once both bus lines are released. The bus
> +	 * state is the authority, while a clean opcode status with either
> +	 * line low is a failed recovery.
> +	 */
> +	if (geni_i2c_bus_is_free(gi2c))
> +		ret = 0;
> +	else if (!ret)
> +		ret = -EBUSY;
> +

Please simplify with ternary condition ?

> +	pm_runtime_put_autosuspend(gi2c->se.dev);
> +
> +	return ret;
> +}
> +[...]
