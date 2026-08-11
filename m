Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4859043A80C
	for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440724; cv=none; b=bqenpMsq0YUNat1a9RJjdF+si9C10/sz9jgjj9Ykx1Pl9bCVQlRscmPZEPczzc9vRMMrO9EujxfVYeRt9zt/6YoX/jcBsR+NMQjug9y9U/wf52BBHbdfs6EvPVPpQXjbuqHp7Ubn5IZTSsnATzI3/vv5DQBtLuSSnErSS36xWXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440724; c=relaxed/simple;
	bh=u91ReNtJhgOHizhOctS1mLFRoqetFf5wRo360YEBbww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiECIXWJJiqRzgB9TYDBIZrSe093aNlBpEZgWXbpncdpDw1jn5tC7v9w+Gk32figTC5zCRWXrqJnolqVQcPl5TH5kQMqM/SU5VibN58r1bbMz4vgM67S4q/wvYuL0xHPGa5sxp6ldDcxQ6IMwvlyqtpZad2qIcWTJKYzucQlFPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8HQUYFq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSazOQFM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8HQUYFq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSazOQFM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B78BCI3307941
	for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 09:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLvgNJF2m8GZrgcuRRob5EYPfrcy3+MhYzQhJ2G0Cco=; b=T8HQUYFqK4YE5JIo
	xgJGAcFL8L0FvQbqBkwfdjQNTE+zBJNQsDTmSGOfcHeC9ccH7/2VXM/YPN1T/1z2
	7rUV9RrIkwhzmqZnO1UjbMq6+aKJcD6+PUCXrvt24a6F4I+hEwwDRykIZ4RXpQGD
	s8CKQZ0B/KuAVql3aY77FjEquSS04/lPmPbkRhaRvUKYM+0gCgNkkCyVK81sZJyr
	UkoiYe+veQVOYn0nq38J48rKI39UBhVnGskvJ3cYUB+FdKyoBv2vToF77lf4S1W0
	0xe8hM/KK+yX9ABoF+YziWhyzuqQUgoaNteGl3fnJuDpavmck+tp+XeIVvykRmBY
	Cv24Sg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfucf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 09:32:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so4661692b3a.3
        for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786440721; x=1787045521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLvgNJF2m8GZrgcuRRob5EYPfrcy3+MhYzQhJ2G0Cco=;
        b=jSazOQFMDL05xm9b3fLDi1iX1pxiLK1n5ysfeG3Q5vd8b8p5aTLoLqZFlaAgvzDcbX
         ugTCBDAzw818/p2LHtKOqSjEjBjf7IXZzS8/aO140LwjKdB/Dku7vbhLClsxfJma1by+
         a68rWXtaurOnTxlb4y2y9X4STd/iiz/jqQrZoyeaOi4GkqUrapyb/MoVPW/LzLXPvyou
         8UvDtKKCoaylbAowC8Bcg30j5H1n7Dv050V/ogeLxsuma4zyVjWIzBV/2x/5PXC3ESl4
         fsKDHH1f5kJDamimmj87msRHyQGfmJyPxFyz8wB5H0NM3+ups43Y9gByPpi8CcmeIZmG
         ppVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440721; x=1787045521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLvgNJF2m8GZrgcuRRob5EYPfrcy3+MhYzQhJ2G0Cco=;
        b=VzGzUcYxaL6LbcvFryCpLBK+9Q9JDiMfnvqpjurCM2SFF0SW1yFuP8VetuWFqtUNXg
         8OqOhDIBGdim9gl2NbiWBq5yxqbUmWhbPvdvAK7pB2d5BuKS2eJhpOZU74eJtC0r56DC
         2SoaAKkgoNUOZXLa6aaDmVgHRAMzSMrALFw+HdUWwQ9NpGmKBUcL3V7Cd2Zeyzpz6tnU
         6YMECYlYY901jzrkGKB4i/VYXL/Hnbi6szoCF2enPn8cjG7de1s7hta/6xPl8vSRA0mQ
         8jJiYkK0Tk+7OlnEZnMoZ9COlnDw2o/GOljO1VstY2RAXOqIhqYIEa2ZzT2XQ09zXowD
         xsOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpb738xK4CWaeNtKaciFwxuYutEy2xG174bPiHIc75LR0/wZRBOHufbUqOigzwWHjAKI0zU3M8s7NU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMWqCLmW8Lb2HZUnwtic4nDxlE+8Y2XtnLVLzy5J6CUqEDDex
	2EX0RfPTxxpuW7ketQOAAMwQm8Od5nn5anM3rwIybUgVt8AVjU+YUCpemBIZcaJ73nDNYYyMmOY
	L6/n9NjGbDBjdyp+qsIEv1Yp5KEkcBUe14THtw56DQ9IW8NF20pNk/yWFQaNp50w=
X-Gm-Gg: AR+sD13AFfWsXMd75ShdORvzb3Zbb5fk1BVpyheVFYMS9xqFlldu/hFfx8MjSRmeMtH
	wgwKIBznJxzT/PqE83QsqZm0xXuCJZBCP/Mk/a9qAJbwhdtUEOZ9w1IBzFrMWnNLWEr+bIwgd/h
	2tPM4qpIi8Z2muyPUNVBy6b/Q8yFtLFup+c0ghi2MTjDlVNSqmXRxrwvcXLUjxz/npYei2Ll2Zz
	XrIfOq1THSBZwQX5ci7JEbl4cyxlUasWqRRv9VIEPwSZQWEhuHQ+WsKoRmHptQGLdJO/Pz4/ks2
	0rrieOOSKLgomUlVT3q7m6YxgkvxZfRzIVShoDejahjzhSHojkmtKormeL5K4du+NcQDbfCKzMv
	5JhEtwn6gdmxIQZ6brLmf/bCZ19aYAHLchw==
X-Received: by 2002:a05:6a00:234a:b0:842:5da3:9b89 with SMTP id d2e1a72fcca58-84fa888ccacmr1609029b3a.38.1786440721050;
        Tue, 11 Aug 2026 02:32:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:234a:b0:842:5da3:9b89 with SMTP id d2e1a72fcca58-84fa888ccacmr1608980b3a.38.1786440720602;
        Tue, 11 Aug 2026 02:32:00 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9526485sm403122b3a.33.2026.08.11.02.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:32:00 -0700 (PDT)
Message-ID: <bd23ec25-52e5-443e-a667-7d78d79de96d@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 15:01:56 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8sl3HVT13yZnRPDaTVkstbf8OdlGBFUl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3OCBTYWx0ZWRfXzsbY9QF6Flsz
 MqseIg+h1YAgBVKczKerP1SD9mmVeZa6jLwf5Ql+xXqjwNugsA2zlLNkU0cZEx47kh/mBK2jaM8
 75qae88P4fWDAMCvoBuZVaIwmdUrTzw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3OCBTYWx0ZWRfXyoztiEcE/T23
 Y1wNIQzGjOsjYUn6F6Ib5WozZrrIcY1P3lL4j5Prs/+N3wzaKi5tS0dLKFkZRGXw4ab+o89o0GW
 rsZU/ewzxG/Ii5SUJ1oq7AIoa1uqPmjceJeRdFeCvEuiR46eSMWMqSVVnRnWwm5xd6Fcp/tI5M1
 CIY8lab29Uz+Nj23twQe+dRhzXEXJ1FqGkTuX43doL58Z94ROWQvgY09Xxj4zIze6QO48mBYEfc
 lVrfPgiDdQOFTasCqmktaly3y0M6RSMzxVDRk/fL0eNb4Ett674dGAOGiWN528cz87S5Oz12Rbw
 +rKB6WbWAEQgbVrPZAwoGHKCGa1GWlxIfjPKEVa3rioq0/P9s7QmcI6PiMQlXT0r/b2hiMAMUKQ
 B2q8H1VXJApmV9e/4IpqOVazy0vfcRW4nV7zxjWO8zC/JqLNF15HE0H+4lrhnce6WSe2fVqotyi
 W0V6IyCH9BAmojXP9Tg==
X-Proofpoint-GUID: 8sl3HVT13yZnRPDaTVkstbf8OdlGBFUl
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7aec12 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=L926Rc6u3fOPukkFLXgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110078



On 8/10/2026 12:21 PM, Aniket Randive wrote:
> The gpi_ch_init() error path has three bugs: sibling channels are
May be instead of three bugs, can actually mention issues
"start here mentioning  the three problems first in generic way."
is what i mentioned, not like write numbers :) .

May be misunderstood.

> not fully reset and deallocated, the event ring pm_state is left
> stale after being freed, and ch_ring leaks if gpi_ch_init() fails.
> 
> Fix the unwind loops in error_start_chan and error_alloc_chan to
> iterate over gpii->gchan[i] instead of the original gchan pointer,
> so each sibling channel is properly reset and deallocated.
> 
> Restore pm_state to DISABLE_STATE after freeing the event ring, so
> gpi_free_chan_resources() does not attempt to free an already freed
> ring or issue a redundant EV_CMD_DEALLOC.
> 
> Free ch_ring in gpi_alloc_chan_resources() if gpi_ch_init() fails,
> since the ring is allocated before the call and would otherwise leak.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---

Review if below looks fine, you may modify/change if anything wrong.

you may wait for other's review and make changes together. Do not upload 
v3 only for this immediately.

Title: Fix resource leaks in gpi_ch_init() error paths

The gpi_ch_init() unwind paths do not clean up resources correctly when
channel initialization fails.

The error_start_chan and error_alloc_chan labels iterate over the
original channel pointer instead of the channels stored in gpii->gchan[].
As a result, previously initialized sibling channels are not properly
reset and deallocated.

The event ring PM state is also left unchanged after the ring is freed.
Subsequent cleanup through gpi_free_chan_resources() may therefore
attempt to free the already released ring and issue a redundant
EV_CMD_DEALLOC command.

Additionally, gpi_alloc_chan_resources() allocates ch_ring before
calling gpi_ch_init(), but does not release it when gpi_ch_init() fails,
resulting in a memory leak.

Fix the unwind paths to operate on the correct channels, restore the
event ring PM state after freeing the ring, and release ch_ring when
channel initialization fails.
