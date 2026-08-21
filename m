Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07235CB87
	for <dmaengine@vger.kernel.org>; Fri, 21 Aug 2026 05:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288861; cv=none; b=XydAutqMYk1b727Jp0nG3MEQuC3YLCSh8HqXcgYlw9qh6IMXQMxeBzHAHFyQhCkgILuEg1fCY10xuRfHmqWMhX3JwSh9vw5J5Bd3UMR3NJ0t9b0OCGoB7D6OB6/O68dvTC7I1GfJLrXdS9DZS7hs0BN1CVToreb+J4Elzqj/twI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288861; c=relaxed/simple;
	bh=hX0xMl1RocF2QCivBcji9cjijZkMYUqq+bU/WzaVaYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUQqE765BE7VL0wDvg/ldDdMybgBmwCXeM8NTvQTRFbwpQu17CY54IFfj3zNfFj+8Rr1q4BuobWTS9C6f5+39dUAHlUpJ6aWXFxaBsk5HD73xCvpej20xcZAcoQLXuNKnzf1pYPTDUsxdtdSFPm4fo/DQ2xTFvCdBJy0H6WV1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTgdELoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqMnWhiB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTgdELoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqMnWhiB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L4FpSo2347409
	for <dmaengine@vger.kernel.org>; Fri, 21 Aug 2026 05:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgVJks6rWjz9+JEM9GtoFAYqpjJvbvWBn2zqOGuRKzo=; b=fTgdELoIOlRmwcHw
	hBYPtxNqZLcZJBODPvcRKDZzAzVxjeYrsfLsOYLgclP/KsHQvmMmUC4hAxb2X4eO
	xLNPQ3n5yIRXlLEI2jvqHTC5AAJY1vwouWXtT2fSmX8bV/6HhHVYc52XjZGXcP0u
	2MOg37Bw1ep0O+j0gpSFZn3EEH0nbLs8/4HpSf9AsJPWoLOwGHHAx32AAIn8kLPg
	BbvMBaZnAASeG1iJDWuPhM6OQS0K8kzg92WNxpr5T7m5Hx/XSIjVcu0X06Xbh3nc
	N0npLKHxwVm7fFBG8Ss9DP/KClOsQtPUHs6jw5PX2OFyJIl5e3Gu760yfngghtH/
	XoSRDw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9r4f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 21 Aug 2026 05:07:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1459411a12.0
        for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 22:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787288859; x=1787893659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgVJks6rWjz9+JEM9GtoFAYqpjJvbvWBn2zqOGuRKzo=;
        b=OqMnWhiBF1ILKXFhDbHEJOb94/0pq3PrhiKdoUJz8EqdioY7r/MACDb1Tcla3cJh0u
         t3BA3Pd+w4Vo7zmJM9d+GoCuite2Xos4db2gHbWyieUt/hMg4ss3VPnNL/7zX+7w2J5i
         ZCYFj4x3GLg6aeHDCwmrWLDjWIhY4wCwdxF1vx/wX3O/gO7W0u4UZC3CYlxpK58Vq9Nl
         I+Uln1PoC4whu3ahQZ6u+lBzy794HrLHMzWUv0UcYTmAS48slFZuYKGpyxzzScKlb6JK
         eWoYua+Qz6j1XlVFHxOSSkYs0imHJmn0c/6rdqe4ESmZPkA+v9QPEZ/CSpEcZ9Gf0bbW
         MTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288859; x=1787893659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgVJks6rWjz9+JEM9GtoFAYqpjJvbvWBn2zqOGuRKzo=;
        b=eCGVSQpjMGTDQ+5lEs4WG3GaIEmCZwHeAerR1fqePaQUiW0pFRxE0JS8vIUcd1I9hg
         Q2dAmnFLbyNSdHKV6xWMQ7P8OrrnLc/K75RqfKvUz6BKPIcyE1pJReVwNdZxfIpTRFg5
         SurdHKqR3zgg2FzsJksNoMmj7ShxZjVZeXrgcG26Sgn/EiWJmkuYB+WbqgjwwyZPTOuu
         LQEtd5Z4pMBURmn+WlH3UxK67ofWRuKBH03ugTlQVY/MyT4D/VCyUCZ/jRivh88vRTVP
         gXA6Dp7eApZwY8VcN3R8dTwxJI1F5ktqW499CXW7+TkfMJNTGcD71h5z+edsP5RDWQjQ
         FiKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrbm9Qn93fsxWJDRdpc6Osaa89USTz/2P53xSybgzxH2OSjJllkldhTPQHtQCFK+OnMRp4DAy/KkD4=@vger.kernel.org
X-Gm-Message-State: AFuF++kpQpLy23ChJKBfeC7xDRwir20YL0MWK3xG0YUl89Ns9TbZ1Yit
	c4uv+DnRL9U6YZUpBh9TFDbXlyF/f3XEZPUDhniiAFjkYth2JOW3koroUp3b8fYlgLSlWG+dbsN
	KhQ5EhiOXWpbT65iazFyP1pKSUvcXtsCXH0//0c4JtW89apGJ9ttL3ZrIIXdHaaQN5oa3gEA=
X-Gm-Gg: AR+sD10TfG6syvygVV7ISrxztChLwgfLBtemQTJj9a9JzyV5wvLNskpTwJInIKtT5x1
	gEOqfLcOPKYoU8TjDSvFIZnVlzybO6UUy1MpBrwaQzjOU7XDEA6uan4XOxxjtuC0bXlCoebSkJa
	GXv7EddFuL0hjsAHAh4qVplqpig1UxLKl9RUwX+/SmGeyR7H8FWtT7lmP81Nae2rrm+lGZk1ecL
	k1eG6LiQHZwV3rEkQ1rXb1Hd/Jwb+EIaENR+8Kj7ZvAI/zHas3nf6nn9Hqsvek+zB9ok07RWpN6
	lp8IVAcPfm7nP/BXcfKIx6zyaIZv4vkBI0diOEThsS+mZasAei9uAadZ6vDsnfCs2P2hHPp7UmA
	U8F6tmgZ12SZMlUOEB1T+oxsNxERGazo=
X-Received: by 2002:a17:90b:4488:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-395c5114895mr2616793a91.9.1787288858861;
        Thu, 20 Aug 2026 22:07:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4488:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-395c5114895mr2616772a91.9.1787288858347;
        Thu, 20 Aug 2026 22:07:38 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c8fd34d9sm386285a91.1.2026.08.20.22.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 22:07:37 -0700 (PDT)
Message-ID: <39b33f3e-08bb-42eb-bc02-9de9810e0058@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 10:37:33 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dmaengine: qcom: gpi: Fix resource leaks as part of
 channel clean up
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMyBTYWx0ZWRfX7ysoCP7rAygQ
 AtcAwIJNRkl24C6TTYWjWVuwOKQ/9oQ9b92X5EjoGxwA7xwduPIBYu69kRU9P4qXl1yaEYXBKeN
 A1v2ooHZIEF46h3Fts5Zm2OG2T1WwkueDMgOJjQC40cNhYC85+qJMqdFzSsmlOh2C1qDzeLKXQh
 QgBK7irWiRlA5GEvw+5cf7gmhadHwrLZcJF7Z9M6rY18GXjj3oPJyV655SiTL8acYnUjduzKhoo
 HhM1FIlCDat2wOrXo+shHRQgScULBXN2q0WAbz+FvRJOrPKn1h9KXbSnowtU0b6cF3NdApG3Yt5
 hu72cfOBSz54vtnUPhIQMgw6u09zmmlKOzjdBfVYjRk/uVNd/3hD5Kr1wFSmCeAW9xuc3g3rsnZ
 MPlzUGjsvSHKLStu7w2zvRVkDibGrZD/OeIiVzIgaDJm4hiVdz13cqt0fWte6wiuyweGMtqrkCP
 OTFBhe3M7xiHwyadfNQ==
X-Proofpoint-ORIG-GUID: G0jkCdHGCIP6PRFiuy0LGYDMEwUcWD8M
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMyBTYWx0ZWRfX71vumhk9pyGt
 poZDtrS12vPFaK13rAW+6lEuPHivNlzEZ8fPkkl9KwMehhuhYzlyx1rj3qpbZpytDrDr/fw8p0r
 0qk8WrGxIKYFajQ1jKV8EDNrgJzSU70=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a87dd1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6mmPj426WQFTegYL:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=SC794FZWIIagycjiN0UA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: G0jkCdHGCIP6PRFiuy0LGYDMEwUcWD8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210033


On 19-08-2026 17:09, Aniket Randive wrote:
> The gpi_ch_init() error handling paths do not fully clean up resources
> when channel initialization fails.
>
> The unwind paths iterate over the original channel pointer instead of
> the channels stored in gpii->gchan[], preventing previously initialized
> sibling channels from being properly reset and deallocated.
>
> In addition, gpi_alloc_chan_resources() allocates ch_ring before calling
> gpi_ch_init(), but does not release it when initialization fails,
> resulting in a memory leak.
>
> The event ring cleanup path also leaves the PM state unchanged after
> freeing the ring. As a result, subsequent cleanup may incorrectly assume
> that the ring is still allocated, leading to a redundant EV_CMD_DEALLOC
> command and an attempt to deallocate an already released ring.
>
> Fix the unwind paths to operate on the correct channels, release
> ch_ring when channel initialization fails, and restore the event ring
> PM state after freeing the ring.
>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
> Changes in v3:
> - Updated the commit message as per Mukesh suggestion.
> - Link to v2: https://patch.msgid.link/20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com
>
> Changes in v2:
> - Updated the commit message as per Mukesh suggestion.
> ---
>   drivers/dma/qcom/gpi.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af..c41bfac65ddf 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
>   error_start_chan:
>   	for (i = i - 1; i >= 0; i--) {
>   		gpi_stop_chan(&gpii->gchan[i]);
> -		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
> +		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
>   	}
>   	i = 2;
>   error_alloc_chan:
>   	for (i = i - 1; i >= 0; i--)
> -		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
> +		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
>   error_alloc_ev_ring:
>   	gpi_disable_interrupts(gpii);
>   error_config_int:
>   	gpi_free_ring(&gpii->ev_ring, gpii);
> +	write_lock_irq(&gpii->pm_lock);
> +	gpii->pm_state = DISABLE_STATE;
> +	write_unlock_irq(&gpii->pm_lock);
>   exit_gpi_init:
>   	return ret;
>   }
> @@ -2065,6 +2068,8 @@ static int gpi_alloc_chan_resources(struct dma_chan *chan)
>   		goto xfer_alloc_err;
>   
>   	ret = gpi_ch_init(gchan);
> +	if (ret)
> +		gpi_free_ring(&gchan->ch_ring, gpii);

Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Thanks,

Praveen Talari

>   
>   	mutex_unlock(&gpii->ctrl_lock);
>   
>
> ---
> base-commit: 415606a7be939835db9b0d6b711887586646346d
> change-id: 20260803-gpi_bug_fix-b0b80ef315b5
>
> Best regards,
> --
> Aniket Randive <aniket.randive@oss.qualcomm.com>
>
>
