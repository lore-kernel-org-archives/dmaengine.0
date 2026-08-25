Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F25332604
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 04:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787633365; cv=none; b=WO3vrCiJT051Nn83Xl54QnO0WiFkSUbOeCYc+VkA2QGQ3uDDS5qnX6t9hdmJOKHRbQKS0BZs23GndiYyId7dUIaplN6GlZfHrgRbOnaqNAV2qCluTADBhkJZ5sLpimEbzxKFMHDvWOoiM93kARQVWDiw8vLcCFQlfBiCy71odcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787633365; c=relaxed/simple;
	bh=CY10c+SsCZLLB/dTAj2Vyfu1GdN7O0xfolidgRQojxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4Y1NkI509MhWHhsLZH2DK6Pe7Pqu9QtiI1/ooqweUAOH5svVk2wcrWx3ENW0HQRRNwulG5Td1Dg+uPzmwt67SH9PXX8ZEhzM9BMI9ACPRU3JIPCTIs2DQA3cpbIKk5qhpfuQnt4PzSpJqqJtieq0h4FEKjpReCOrQQWokcT3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F30DOgTJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGrZl38H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F30DOgTJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGrZl38H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R2E9404982
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 04:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FffqYxo91ZO5qsia5gBV4g+VhCBgHQD0R4Yk0vPgEE=; b=F30DOgTJ8QE0ZAD8
	jid+DtrMlPexEKMDz5ucbutXqeGy538Au5avEctwjdlZbFTRbmbERYaafW3Q0pvp
	d76d23pjVNcHpahVG6gc3c4CfS7QY6waSEHixTs8WucmZQQDbKU9yN+OaqnBNrz5
	BYueJCiYjw21VXby4vmkqDO7/+/OK+qou2PGX/PvDN6q+dgZ2fFCwABTuw8I2Ovg
	t9pjQxdgr/ElfdwkNS+RFdKnBcMVokd0HLpWEuvjm8wHqzNxJ5NarbqGP1+J/+Rl
	KmnyOMrpZHDxcoC+p83sYWG2b164Vy9fAwjq+aroQtw1qLP4PjQ9VMR+6gq/2lgw
	jpJ72Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jgwut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 04:49:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso4447080a12.1
        for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 21:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787633362; x=1788238162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FffqYxo91ZO5qsia5gBV4g+VhCBgHQD0R4Yk0vPgEE=;
        b=JGrZl38HuR7p9SEhMC/HpTXaWWKi0IlC9epfRhY6xNsfmiCN2AzEB0XIZTq2NemdRG
         s8EMp+WFpRySJTtxZC+0yHIxBpyvzzhR0+IYSxtPSGllSwOd2EFEuNFXWxhGf+JlFLY5
         fSrvqsDrmeKTCZkrLuMbqJX3TH6qJIpZK77ITnQPdmem2bBNo7KEa3v9WdpSCzIF3M7Q
         YdXFMW5WmNn071oI+IYJ76rf902ol1mWCTk98foJ2z5f+ceRfw1sSA8h2V8ZveBFG5xK
         eyuLDk0p5kfs0wdLrfHymFeruYLNsJuXcs9GdcExKVQyhENQbbj18BDMcL7LIvJzUA5t
         WMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787633362; x=1788238162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FffqYxo91ZO5qsia5gBV4g+VhCBgHQD0R4Yk0vPgEE=;
        b=I/5AOlfZHezGd0n1yZ4WqsOXQZFPzOSYYUKcQ052utFZYSjJsMKrug48s5O8ZRLIlb
         CH54aFXvb4hS6BHB39iobkTE0HO72MIahziOuRjGJ4WK3zP+25hc9Dq5ddA6EcriD+1d
         k5GGjHkJFy/MhD568D9vu6W4Gy76gqyOlo5NbUOm2GFOdYbpyxg05BDWiDsY2PnjaCzV
         5KjgwXtKUw0eio86B8CIoZuBMdRNAcIWzuBJCmM74Sg6DHw4nJJBDY/6Gk8i/m2xAieX
         R+s0gAmPaRE/PF54l0F6rLhP1Tb43unLugfnJgBr7umGg634KEUW8ew7mpFxFpWWNXQT
         PZmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpmy8wuGaN5vyKETPO5bDZmWdorkA1U6rbNFFP6phVwQI5rlpLTsOq2+2fLYQxojhfFJfZD7lH6ivs=@vger.kernel.org
X-Gm-Message-State: AFuF++mRovjM6yy0peNhNV0uigHT48UjKLA9o8a7sFmLGH5jUYDFdfP5
	m6Zi2AaiKRm/PFKfjnHCL5fsHdPN6mZLLmA/HglVYCZ0TCKFDCE4Q0xHInGdpkSojb5O6g6e3HT
	3IwtK1+a0Chw+GvLYG/sDukbHReiY2AbFz2t1uFPZAGAsOEeFBbTVFbURzY3cv0g=
X-Gm-Gg: AR+sD11BK0M+cxsvwXkIDccjv1EAeGVMJjHZl1Ud4Fx5UwAHZAxjxLAlht62+TsyT6M
	s3ZJZ6NzXAnesY77BidMSAUHY6PDu2YU/U3CpV+hQEu9azd5KQDFPb5ya+fTxIRiCCuaT+jPukl
	M53er7p4xsU0Hk4UrPTZ5tg1tIPWdDw/w079Es6k+RvxxHX0+7DK5hPG86pceTKl/2IUraBFhcq
	AgP1mvDHN4f4M0uWxBGQCL71sWVav+9PLQrPttP+Pz9zaAjaOKSmIMVQokm6Y6p1PHEiWviujY6
	j1WyF1N3OA/9hVqKHB2Y7z+i52BXX+zE6yb9YM7D3fBbTnK2/IkbFGXgwWTZQgKSTKdanNZPgNK
	1xKm2eeb0LRuq800bWZ3XianNW1q8dAIrN3I=
X-Received: by 2002:a05:6a20:6a0c:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3cd9103c9d7mr6749891637.1.1787633361911;
        Mon, 24 Aug 2026 21:49:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0c:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3cd9103c9d7mr6749828637.1.1787633361536;
        Mon, 24 Aug 2026 21:49:21 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm33369978eec.17.2026.08.24.21.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 21:49:20 -0700 (PDT)
Message-ID: <86108a2d-fc50-4da1-84c9-08c2c251e9ae@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:19:16 +0530
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
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d1ed2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6mmPj426WQFTegYL:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GzXZL8swykh1ldS5u6sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAzOCBTYWx0ZWRfXxOkgpOgDiDO5
 32v3SQSZQjF6gmn9iaTWV5LAZK8mmiWFDpP/6VhWS1X6ZKn6JHniLIUPliaNISPebhPCHMcQIvM
 EACH1cEEGrSj8XYyEdUilKDBpJB8HF3rrmG8hFjFXUKFPFEKYhds13dReLZ+sh7lwDqxHl5NWY/
 kFAW+w1Va2qoZbg+lNIaYjS1FNMutycrDwXlNfRqtTh2sZihmdVe5T/+06cBgbspKl6rXfjVRBj
 UjNf1TvZ25/4Nt7Ln2ppxcc6WEVKmJEy+Y5uGlJ+BYpZSTOcvFJJQUeCD5UXYJqHO6+v5vkmSF5
 mzNnCxIJVOv5hzyqqn+5cFhr9iF/ptIUD2CFF6FdxGny2yIeJNbJ25kYUa7DIpnrmMIMeOe4rtw
 KtrnODeEw5C1X9+kRCmXNb/+sRub1+GxdCWff0e6twyyiHMnvxn6P+/Sk++7KgA1myPj2XuNtgw
 wasrPG1/AvV2femotHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAzOCBTYWx0ZWRfX229wIJMB+sWU
 eXzTfPHe2aN/7hrVuKNsH7or0Y+wu9TDtTIS+2ku8Q7mj5ilPmoG9aC1lzqv2mzagvnDTDvgACl
 drTFEAsmGKfozcjECGHt/wCvoCHem7M=
X-Proofpoint-GUID: YTTMZALk4cR_tAd_MlSm-2IpTIbF-uEz
X-Proofpoint-ORIG-GUID: YTTMZALk4cR_tAd_MlSm-2IpTIbF-uEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250038



On 8/19/2026 5:09 PM, Aniket Randive wrote:
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
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
