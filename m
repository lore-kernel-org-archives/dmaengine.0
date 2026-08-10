Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B6397933
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 06:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344783; cv=none; b=ra3ZnKdNT5iyS/J2uvwI1EAZDzZn3GruH+1kutg4PkBUQVpxOjBOtjJhGa6O9QUp6zUucqL4Zmzq7YfefTqPFziqr/h4jNq9CmDwY2T3+rvojPGpZ0gZ1i0uYX1uKqfii48R9cZtnC4YWhJQwS/W2J/KXEjTs3FQ1uSSXg2BYP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344783; c=relaxed/simple;
	bh=J5HyjCo0xLWf7G9hTgG6q8VLKjpFppvIjXzqR/QHcow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nkz4gljkO9WkbtqLg6NjJsTl88/zndIcJE9nL9WImjhObBAdEAWOuAscmIlVjrOebIyU37wNi/hGFJCcyVuPwT60H2TX6f6+MBeNSVVuaXzNeTdLTT5Svo/2GtjwyOYkyNyxrLUzpDijwQOj+587ifV75wS2bkK2It9yRs86ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E42c/wyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QV56OGAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E42c/wyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QV56OGAE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5Hb2X1771465
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 06:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxNP1XVIU2h+ocn5N02vtGQLncr6TSEDgpCOcj0bI6U=; b=E42c/wyl45umUSN1
	4Zta/Lah8hXVWDnlsuUjOgaLwo7Vb29j2XexfqRSMg+LJhxALPPTMWaOx1a/IEc2
	yWiLyMR3ty87Zn1fGTrDP0XvPvRIqIjJvZgWCO3SOj6zBUy8QwGXyU+qqTQG0RLb
	ZEVcbs1W5iMuLYpviyXHpngzRmMOGRgK7zsCLmhqGMWx5ub5malfzP9qw8Y7IqSM
	N1xxThTfzQftFD1OWaVogYmHGC8OvmYHkieqPgMboULrrLLQ+dev/4TcaC0MKkYH
	G3/YgqKKg1xMqD8HnzX5dU+x1pUeNDFLZrWFraX1oBDFuaETiq0KZ2ho/FpSKYlx
	sjVzGA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kh7d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 06:53:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1100784a12.2
        for <dmaengine@vger.kernel.org>; Sun, 09 Aug 2026 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786344780; x=1786949580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxNP1XVIU2h+ocn5N02vtGQLncr6TSEDgpCOcj0bI6U=;
        b=QV56OGAEwoXzg+93Kev7AwCsFy/CF/vQ/MqqaedDBjrcZvJfZ+tysB/8DCvTmb4HHY
         UEOZ/hQF2DLHYTWOV239n6j9JHCLlGLcqkUrNHgM82m30Ee52uzvrg+1bl5NmjWH9C3T
         IoMdBRJqJr+gIgs891sHR/MMq8T4ilSoIl7uF5dIMM5LB6viY/8z/9mMFOFwCjsnYFnQ
         ANW/GSXQ/wliSwzFkIU1JojxQiLDVkZFvCqliz0uKoJQRhgnkrOHUIc2FHTgA8BUNAVz
         hsUS29D/dpU9lD2eYK0LpB8oswEzGNtjso1xzcxbG+zkfMXkA0Ek0qhFidXIjqk5cPhC
         0i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344780; x=1786949580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxNP1XVIU2h+ocn5N02vtGQLncr6TSEDgpCOcj0bI6U=;
        b=lfs47wOGusTCtaio0JF6QmPeDmq9BTotYgZj+zoZMz18hI76Izp7w5N9s+TOSiP0Mh
         1WwjukmjaV+xkQVopNg1B42qHQ4n7/MPVXLwypF6cQSKgsKLqMqnuIpt0wpR69EvDGKo
         kBxSFHe/ysleJuvhpzeXy94iEfkfII/kji3ky+7pUDQ2pA7LZQ7IbEyZxGnNJXJB9ZVd
         deGUAYiRteZQ54DAHr+imXLQwnm5Nu9/G4Y8KXaHmeK5CBkK8C5fDSekgNwzmClSYleV
         yE5dxDxXHgOVWPgHL5Xgl6a+t+HH4nOinbicGA097YNvCqTp4oeOBAv6L90xgM0fq49S
         UxbA==
X-Forwarded-Encrypted: i=1; AHgh+Roa1Bb8cIxd2nan4rAUtBvzgovBjk8Olw8czBKxp+hayPEuRpKEltPjumUPAVbuGVisam1jEBD3Q+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHm+Ig1mm4ZzFLTmlG7Hb5ccuV9MAMnHG7yjp2GAPQtT/Ncr+
	w7OHRwKC2/9hh4egAmmENLzWeimb8UcOTvpjX5C2tu/sZXGAcD36BpV9xY1p77ZzdUyIeifSZcH
	ERHnX/hzDtK50wy2P19pKEfHgBug5yq3AcPmR7z7fIMClloN/lIfpFwVCXoX14nA=
X-Gm-Gg: AR+sD12dyuig6J6muiuSWDFNZM9ZJT2hozOn/F5idwMmEb5MK+qqGYSjB3u0uTk39lG
	9iustesCwC0GMj1ij5y1y/oZj6FYVAcqnvxi/GJBgP3aw1Sy7FGQh5FW/ZVYkP8Ii07821B/PJu
	dNqEWXOe6mVNsIcdWO7yQTTCjNFOGu6BnPWk0xBzae0NCoiGqru6aY1zJXQqMnq+g+GoTrZ7kvT
	WNfD+WvIshj4uPFIC6ebV+h0a6rzD1/xc7HDUOER7ZV7vo9TSRoODR4s066NZWc9ywpfiKTPJFx
	pZ+uRhnAczWTbOyb6Y9fRubGRxTP4QfZVSj1mQmBvpID+q7npQqwcXmuT8smBJa90DmcSNHwutS
	l28HdhWQNGPGuHmo9UvIyOuMSXo1m+9Rx
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr15555055a91.13.1786344780426;
        Sun, 09 Aug 2026 23:53:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr15555023a91.13.1786344779990;
        Sun, 09 Aug 2026 23:52:59 -0700 (PDT)
Received: from [10.218.33.218] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff6658bsm11333631a91.14.2026.08.09.23.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 23:52:59 -0700 (PDT)
Message-ID: <22638805-adfb-47ed-9fbc-425cb6f6874e@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:22:53 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803120316.2703956-1-aniket.randive@oss.qualcomm.com>
 <b4e092f8-a991-4028-ad24-983dacba7daf@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <b4e092f8-a991-4028-ad24-983dacba7daf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YOgjkmt-5qiHXP1f4wvouFbMjqQi8wiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfXy2EQKCSwfvlc
 ejstjz56kDBTkyY1TQglc0NnhDU+1nqALbGYs+qOCyyNMM3RczA4XqBwo/fVaNDpoM5m94fo0Q4
 ba16qhO5Lr+ZRC5CHkh8LwpqHKyQ44TV+Dc/S0L/ZEq/aQRiCLoRUSnXltEwy63nTlANWuYYaou
 8Cyo/Go63onWUsQVMGTth6sRtgWE3hk6LDsWkHYFZs1C8FynMnxcYi0mNm/kdz5q9RuiCb9Beex
 puQoY8ojFhbRaYRGnLbHHcGZzZuQiuXIZAEbznpR38MXuBXXVpw8iAie1M8ZV24GETrXyUPKeoV
 AIamim+rEqyYMUD5FsVOY1q4mI13Cty/KhJa5QQjOXUpddtOLobe/XyLIcnlxb9F7dYUjOthyAt
 0HmRrU1fC16tIWGwZ+QkO0cjV0hiyatCLQ44elJLsSF6/cxRtwVrgizry713ONs8/UxINYy2HDy
 IHSjGnMhRmPHmxxLKow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfX4Xnuz9Y74Y3I
 WKrc9oR1nlgojJq/4b9B0QW1+wjxLk5ja9D7zvt7WtF7VZeoBQvU1fJpjTSjQg0bgF78Oaen7X/
 DeEIw9KDvH7mTGP0zqrlogtiBa2AyYM=
X-Proofpoint-GUID: YOgjkmt-5qiHXP1f4wvouFbMjqQi8wiT
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79754d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4-XsAOMHq4YBx5iLfxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100057

Thanks Mukesh for the review.

I will update the commit message as per your suggestion.

Thanks,
Aniket

On 8/7/2026 5:10 PM, Mukesh Savaliya wrote:
> 
> 
> On 8/3/2026 5:33 PM, Aniket Randive wrote:
>> Fix three issues in the gpi_ch_init() error path.
>>
> start here mentioning  the three problems first in generic way.
>> Use the indexed channel in the error_start_chan and
>> error_alloc_chan unwind loops instead of the original gchan
>> pointer. Otherwise, each iteration operates on the same channel,
>> leaving sibling channels unreset and undeallocated on failure.
> 
> meaning, channel cleanup not happened ? make it simpler anyway.
>>
>> Clear pm_state after freeing the event ring in the error path.
>> gpi_alloc_ev_chan() sets pm_state to ACTIVE_STATE, but the error
>> path frees ev_ring without restoring pm_state. As a result,
>> gpi_free_chan_resources() may attempt to deallocate an already
>> freed event ring and issue a redundant EV_CMD_DEALLOC.
>>
> Looking at your change, it looks we are cleaning up gpii iterating over 
> each channel along with setting proper state.  Code seems simpler than 
> the commit log, so request you to simplify.
> 
>> Also free ch_ring in gpi_alloc_chan_resources() if gpi_ch_init()
>> fails. The ring is allocated before calling gpi_ch_init(), so a
>> failure leaves it leaked without this free.
>>
>> Fix all three issues by unwinding the correct channels, restoring
>> pm_state to DISABLE_STATE after freeing the event ring, and freeing
>> ch_ring on gpi_ch_init() failure.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/gpi.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> 
> [...]
> 

