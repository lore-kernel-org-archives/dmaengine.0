Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705740;
	b=BYSDrK9etcVLb93uhekAcq6SOz+8YSF9tr5wJ8ksJ94BLGRJ/T1HTquXvYcftRayhyvv
	 yzoUVW0pjXDXyz9KXu+eNXrF4xzhZan8l6MjYLo4n5jxAkBAKHSEpQdp6nMYr9rMYZ4lE
	 GAT1eCy2lbKeD3ZFO56nOJASgtU6j5UmRyCaBHyqhLlAzzIJMfFm7iIDJPYJS2W19znj3
	 j3fjr0oo45DF/6XlE0m7YZ2H/nDkFSgm2NxO4ntnCBze2hvKf94xEgKWlBAp+R5d5G2A8
	 +qmk7vYfF9q+VjQLydVePTdQlMfnEXAtifZXGDndZ5xFL0eXVFLXoLWrgeSfE1RM4vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
	b=C6QaMj9YSz5EtvjM6HxFs/cpSEnGaQTUnbyXgevRDIVfGEWmSAFym3fYPV1JAZYeFSx8
	 ckbtfibfpFvvRRWGtJJypcHYMG5LsDKUY5edSsXt+rMbTLE67UhB27UZcJz25WiWrewXR
	 cIP6k/xINUq/ClyldG51RPsQxxE4AjIEA0OmfakAImpbX6Z0clxRDPpbz8NGOLCnQPNhX
	 W7z7UBdLLGEKTPIE9b+tsOBUJgVKpwMgPQ5mJ53d2Rzv7m8o6PCQdoy01+OMaLvrCRzqv
	 zE2kT994tSdgx/fS5xhYFwPbvo9W5+NtOmO6/Oo2bE0n4IdR7a2BvSaylwLxkfIfihw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKc8s69D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSb1gsKM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89466606D802
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 11:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89466606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKc8s69D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSb1gsKM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AANBC2554885
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 11:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=; b=aKc8s69DSW5Ycs5j
	jJHnaaQA1Qm/BO2HMQYM3VS1zS8PUbT0qlYLBaeucsZiCvGRqHwzTzR1CyNKDltY
	5Px0zMSxKzmT86JCJe5e9vte6ketF6TkfuHzwjY+n8ELYKE3hgIQ5/kQq4u/jvaC
	F4c5g48M+PVW7YF+9j1O5MGFH1SaC1Oyh/zt9F0i4URDmPD+sw3qWjjFh8MGp2Zu
	Csz4URuqDwbTmDyu2Bf6frVEiVhdq0EYxHwcZbe6RdvB4qUHyrXRMX12cE73yBvQ
	WofBam+1jS3XpiHaeSJao+Z9G8tDPjUJAxeOSKKNvzKtNJStvwIW/P+/l5H0igAo
	k18SZQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjx4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:35:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so62984375ad.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705737; x=1794310537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
        b=TSb1gsKMn5AElqC6j7qZNL7HmDnLzXTh6SX9nG+dHPuccp1mFP7tAjCIPvCvEBMTGM
         7BnBkgk9sJ59d8oeKKP3YdiYBd9OUDUeWMkUPyCWyb2CwCweQVLou9CODzb50t8UJJAx
         +iTdV5xYYtmRCu4Osc/hGtNqjbWZEnvm019W0Xt5qx+1GNdkV5Jo6H2czh2Bt0fmahQq
         EufO1LKQQwIU/KWO+w/lkTIQa5YgKFSw+G161rtcjCbPeEGXmbwY+6xPrl9QseiT8Tvk
         AI7Ufricn4l3kMgcKdC4AsLAGJIu03yjBAj8OUOFkuTznowGQ+bDmnfk7OXl75yVENQk
         zbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705737; x=1794310537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
        b=dtRvlfn8oCOdB5ynbhHoKaxtcS8SbdEyGUt7OoU4UGE2aw2LxZV8lZL7I2+ATQAQJE
         8s+U7WWzCIS2Sa0mczPca5OLGZFgibUE9h7q+ardUx7fOsPPhxifs7pnMD/7HW0mbMpf
         6+0iQJIOg/s4y2Ibk9jDAveWGcRNEwSXSFsaKT9PI09PcpGOjX8ljs94JqA3Ae+dX0Kq
         HOnJp4I7CsiDxwH+rtFWTYXs2ODOeL2eyvMQUolcRiyBJJXL6ggMsAcDwgpd1v1QiUQE
         r4gL/twhTCsyxawgdShwg0zK7QecwhG/E4pyHMIkVN5C9aYrIwHiXf6eKLCBXH98sxeA
         U2/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqLvMwMQTh8MgQCP4sF7/93VZTOvHzUxPtUDGDt6cyRyLuSodhkp/FrDDaiVGRNlm9pgAiriYhP6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XYnLuBj7b1g8TV5Q0y6nly9YtDTgwhyap+ynY1BKU17xE4/Wi
	DikzxNw8yLehRQgI5k3JfaiPITVEVabKG72zHKAojvvalea6zayGXnDqJt7YrPh8guQp68vuXHH
	+BWb3sinI7MPJbf+Ny+yElFVP1NuGHrjjk5lid975DfvmmF5C14cqkMgUh4ble4xoDQn7IVY=
X-Gm-Gg: AYBFou2E5giCjXKJLD8lc2XsYL+G7gYVLaUujto6xBOghxNvN/6GUXCFtbbcmzGax2G
	8QhkG7BUbwyIYHC58Ixq5N9+9Ix+0gWprqdoDbtMmCEs/yfaQvPOVGVFzMSxZhp+CFPGriqwiQo
	Gvbcntyz/TtZVvYGJRIQBoR9+1N6nYR4nW5u0YUicTFQWINarr2uXfOvasTXJSKXhdTKNsFHgO5
	XDfZgaI8gbGU5QMdcRRmvnKJvg/fOL6zBZHNm/S32RdODzGW85eeko9UqLy/RiPKVa7oRNIg+nu
	1SMPTNer0YT0oAje+I4i1IORI5vDv7cUL3qzngdKr9GLE1GJBX4x/6C74cUQgTr7PCOV94K4N0X
	YJtasplLecbEmGY/yTsCwKWO9z1tTzkqQ5n1EzQBz0IL959alBnfrkX7HZM65gWecS+4YfoBm5K
	lUQP4JFw==
X-Received: by 2002:a17:902:f645:b0:2e9:734c:501d with SMTP id d9443c01a7336-2eb3649bc22mr127001835ad.16.1793705737419;
        Tue, 03 Nov 2026 03:35:37 -0800 (PST)
X-Received: by 2002:a17:902:f645:b0:2e9:734c:501d with SMTP id d9443c01a7336-2eb3649bc22mr127001495ad.16.1793705736865;
        Tue, 03 Nov 2026 03:35:36 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052effsm39802075ad.3.2026.11.03.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:35:35 -0800 (PST)
Message-ID: <0b80b85a-5a56-475d-9dde-0d554f8ec8aa@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:05:31 +0530
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
Subject: Re: [PATCH v4 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9c70a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kinZEuG-tb8UP0AvViIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfXwr09k+txwrtS
 7QRQ226H7aHGx9PJCamotQiv4uX/Ht0hGUSZodrPpPBgxVSBMVNNI01AanHROkZccPcR78e8Hk8
 knGm6cGDW7WxtIma+aaGBNpZGbGlov/mhq/OcwXfbCUK8pM7vEGM4G/LwQHl9uqbuCOScnGQfv7
 2Cag0+f6WbsgzhtaZ4xvVeum3Z3RbqicDt8JEAz1PtNrhqGtHcGtBBouYb12ufu6C7Pq4rnNAYT
 L+fnEWn9dd7hugZswhC/ZVbtyhPhpDLE3iUud48yDr/eCb3BldijgtUS5eV/4wjXyYpfArFeYLH
 04mH7jUWSRKxpW3ZudBuhGA8yu+U9PWS0pJ0txR1ibkRr2Ry+idXxNCF3+wAWKHBeNA7Z124s+8
 Vwr2FIstMOvowpxXoSpbyvoQu5Z+O4KCnjAVF+CYaxZCKUQDukZv3w5mZ/3f+PXWA5s0QOGXL2y
 x4RvLHgdjTWDZIoIulw==
X-Proofpoint-GUID: 4zgGOJZN-N_J-aFXAE7KOhqiBH3zr-W1
X-Proofpoint-ORIG-GUID: 4zgGOJZN-N_J-aFXAE7KOhqiBH3zr-W1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX2/1WHqx/KM0w
 Sf1YgUSvX2oVa8fCI9EzQ+2Hh2fk6RJ3md44Plj8s+lza8nJQ4pjoYnB9kktMj/EBhAkbIr8bpQ
 j86agcR/4+e31sNZQxchYF9szY/oYL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in FIFO mode can fail with -EPROTO, -ETIMEDOUT or
> -EAGAIN when a target holds SDA low, leaving the bus stuck and
> preventing subsequent transactions.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> hardware opcodes to restore the bus to an idle state. Check the SDA
> line state through SE_GENI_IOS.RX_DATA_IN and skip recovery when the
> bus is already free. Trigger recovery automatically from
> geni_i2c_xfer() on -EPROTO, -ETIMEDOUT and -EAGAIN (arbitration-lost)
> errors, and register the recovery callback through i2c_bus_recovery_info
> to allow recovery via i2c_recover_bus().
> 
> Use the adapter timeout for recovery commands. Configure the serial clock
> and bus timing after runtime resume so direct calls to i2c_recover_bus()
> do not depend on an earlier transfer having configured them.
> 
> This adds bus recovery support for FIFO mode only.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
