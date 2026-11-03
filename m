Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706459;
	b=ftu/G8lClQ52eh4cGWugV/lQk4oC/twdFERA+MfRfOhf/1N7tSffEHQ7eNCy0rHAZiY+
	 y523azkypfykXM1g4sk8lzw19qKwtNQ2xsA/yvtaKocSIFpU9tut3pxxfRL/nKrGaAwJK
	 yMKcghMbqq8E8XTgTa7/AfM4J0TQ5C1jzbJdEVxB4PukCbpuhG1wuxB3luhfB0xWH5G+O
	 3va8h8YU8XeYimQnYRcXcbvb0n5mFTee9zuxZFQ+EHvgO8fiqozlxBLVIpojb8dT34VfW
	 U4ffti1ftjjOrjQ0vxxZwNa03UGKSEcL0OnC3Z/bH988ZM7DC+5o4wDuzIKzq85BNMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
	b=c6WAqzlRBcqmnRfUHrSUwt/3yITX2kzttSwt5l+U3Wj0R5Qo24IWNBe1BDCmny1/hMUh
	 ry/J3V2T5zsu/xbUN3Ot8rrWWZBs3WRnmo5mwCBcqU8STfsNzfwkNPBqmfJ+JC3LEt7G0
	 VH3imav9AlXeB8a8eOFkjjZ3HbR5hCs0iZqweMblvhO9JDwzcV4TVrSGY5iHPh7ZkZtm+
	 vmiT/F7FL6da2c0uW5dj4UlCl7fiFAQNsMe/8rpjKnJmCgbapgHa5+BaB1MpUut3Uwp2S
	 dQ/NrDxCi0OI+gw5/h6Mj01q5UpFsg4tMefgR+YD7/7BAkz/BNLMk0A46ue3i/y+bFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEcT6s7N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z++lb+vz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAFE606A32C
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 11:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAFE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEcT6s7N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z++lb+vz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAM912554830
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 11:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=; b=lEcT6s7NS/n9mC6S
	t5+EyoVw2iBm0mUVcFCfmLLzrLG3TSjf6LvKRb6miyQzMUXQMcWXkiJEk7BhSJAB
	QyN3vLhMuwrxjZn0VP2sIJxIRxKpIRTwUy+uay1/OqcalUe7doJuJxlvrTRzvj/3
	5oPNQRiGPnGV1f4iUb+BEUb/6CSvm6XtP7ky0fumzVqEBLwggf3yppRFxHxdHJJb
	w/IEhssBXLus2WFZiTB+7DtWQFCqIteGrOc/ZIkzJhV9cIKDzO/ZZ2uWxZuJ26st
	95NtxqiO8EBpM+2bFoyhIP9UeiCq3mg9m1/rApddhFz3aBGjHHQRq06vZtS6jVWx
	en+5vg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjyj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:47:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so9065637eec.1
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 03:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706457; x=1794311257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
        b=Z++lb+vzo/TT+/Ugd+doJDxO14lcMbXfTqksucPEZ8rec9SDflYTk1blTZa1n22Us7
         dA6HF6MKP6o33WLH83GyADaAqkUZM58mMZUen+2UpTSPs05XGTclDqSSH2vuRoy/WQsa
         7SSk+rLKVOusXsujNiB3Y9K3inC1xuLJL9LP7WAO0nTpHaQ7rKZHncHUWjZVcbabYa48
         67kQicJFiY07hrhc2JAN65neccJHWwieIh0LMD8bp6Hd24BbiFTf4kEueN5nShRX75v3
         fwB92QD+E+6eTlwxBGHlW+cEEk8YuxZUAp3fLTlL6ru9IvqQOUrPZK8GXZz4lgslAh5f
         SKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706457; x=1794311257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
        b=08iEtHKWtttpXZJCD5JrCy/XcsJBVcAOzng8VngGQpqhTnU+we7Snc8s5bP1iKCjCt
         sAcEB8Uafqf6JWbHBdZxe5h6ucQDPlCPAc8KHbUM5Al5Z+6VuUMfR+CQm1/Ivl4PSlpq
         I0j6s2sO68+HdnZEzRXzrvKPwJhZCneg81PbNuFXdKCYGp4r3NCrDnxCOYinKTVnI3SL
         gwPduBb67eR4LfTstuUWINTlgX6b9OtgN+p7HDUbTvv8pXEwQIAY3VInRj7cKtxZDFCW
         BEy308Y8VeWt41b/Lkx7SgKbpcB2fIfuvpKDPYAtcB6XsaROAsWkOz3kPeZn3/ZhtItk
         eJUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwijLOo/RgMHJNnPu9ZpwoR3ADxK8Fe5/EFKrXUGXtnUz9XYyn+0JL7vweKcsxwf6jXLVV3yRMwykw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FhtF6muxtnkauwEWuucL0VI60TIuk4Ph2Tlv9Z5yzTgDe9Evk
	s/S8w7RkntEwEH3U52f3QgitL74055doFg/TOZsc1JseKJvq+d78LUL1slne4L8qOndy9iEf35J
	Cotq0vCW0UTJFFQwbh4DCNCXn4R7Owdho1VeETWSSlKB7xfwRmFMQwYsMCgDBzKM=
X-Gm-Gg: AYBFou318oqtHZ8AgeVbGT2eX5HWfzooQeXY3jHyDWO6HgO82KKYxeHBeVtoqTNKoYl
	HiQe2odfJj37HzqaaNNmYAd5b/apPXkt9X18Zs/2SlVuWDjkItiS6kYli0KGuY5zNgwcfUGn5bp
	UL9HflvWLZlvInU3PXbvGuTDcLixGf3xi3J2AHFWUVGmWxDKgiQ4YfaspQe5yDXsNxEmy7NXV+5
	vrjH3AljDSEIkmURlJI1mi3PFW6qtzUr6UuvYC6IvNgjjc+WTqnoToxoMjzVqewVIRrKyieAisA
	CUPs44zEMv3KIGmDEY/X2nDfv4tVs/gRMJaDC9P82lM32iuSGkpBqy3Aus9s8l++k9IpG7rZ2sP
	G/zqAaAB6CV+p0oVcyqIK7S+mFcf9KAwhF5kD0DpEUSQMy1v0RrbuCk27cnKQMT6nySP+TL+gNE
	JKO4k8lQ==
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr19630973eec.38.1793706456467;
        Tue, 03 Nov 2026 03:47:36 -0800 (PST)
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr19630950eec.38.1793706455973;
        Tue, 03 Nov 2026 03:47:35 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm52840006eec.11.2026.11.03.03.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:47:35 -0800 (PST)
Message-ID: <bf8d0564-8ce4-452c-b211-94ac37f39209@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:17:28 +0530
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
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9c9d9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ljc_7vWThQ_RCqSD0EwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX7oWkATJfTsw9
 Q5JGDa/d1zBcQmx+JM1BuDvOP1vlI4wQq41ooJpbIycc98ZoCDW/SZUkU8bQJJvEFJ0/QPWpO0J
 nolBlo/jgpwrG1fELR+wz9i5aycgCtYl2al5Z31qxIQrrUTArPk0cGFWLA402slaTXzemHoCt/2
 Vf07GqBnPVJmcJ0QQq462TMvhs55gaAodqeDPbqJ553dJgv9984gT5cvb9+XqN7IoknQnrMmX/T
 E48N+cN4k7MQiWsfrUIj+FRe3jpJRmKG6kcQq7gFn0RYPwQG10x01IXxzC3BrQUrhQcsi+qEIWl
 nz4kn2XZS+UycvY+oGDX623MmvxnHN0J5bkcOma+O0MJ0BAvHUICfXd7y2DM1D/wmLa4dNWTuhw
 VSf1jGjNNwPyeMrGsMdXnVaKMsJxw43EAWfHUgf5+URVfbVM2gkTNc6fJyNczbdqdYOph0ePVM+
 XG9nzlqmOWm7vCTL/jQ==
X-Proofpoint-GUID: neWmBrqQBOAFtzHlcE5KRCa5DXOwX3k-
X-Proofpoint-ORIG-GUID: neWmBrqQBOAFtzHlcE5KRCa5DXOwX3k-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfXz111W5fo5BSY
 TWAWRWBKpxDJ88p3vf4KZCxmwVg7s5cfi/1ciLj5veqBGeOYaFcMbLGFN0Gu9zWBtxSbH2s2zxA
 72ygDQne0Q/y05X2+KjiWo6MLMyrd9g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046



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
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
