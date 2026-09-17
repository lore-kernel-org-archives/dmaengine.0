Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00583A9610
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 03:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616505; cv=none; b=GZVDjvXL0YwGTAjrm6bxNJRioCcVJsirl44R0LtQi1Tc/Tnfy2x7FgpoDjuS123aAT+mAgtG+LaEx6RDgaQs9XiyhWyAQ/OX6vBJHE0/imNMngdN+pyZ0TpjDFJ8dd1CL6aV8evj92iN8FVtAL/yLLcmht0OycFh+a+92a5QlI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616505; c=relaxed/simple;
	bh=4XhJsmVizhzHozwZPuPySnL45oeWWBP+08eCboV7Wms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWciD35wz25lYmrdnJr3JfOSWhII04shkAdgXNio7fc8Aliefq4i1Jr8c5kniI8eCopmCwvJsKfVtfvTT7QyOORqrIbTJ2lfRxdiltkoWJ8ks6Ua1lAzksfEW3zOp8IrAcqaujQSBnZRljktkM/U2g4KwCx2EygKCMBpzySWPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzC194yH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbLberWq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzC194yH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbLberWq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0Tr5k3597322
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 03:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B5C8wjP4LGLq/ehI6YaOhoiR
	mBukehjstLcbOo1B3qM=; b=NzC194yHrdG/MscmREOBfbUZ903PjJFPlId0LMff
	8LF7xeLYFhyMg8L9w8CLKaR+2cERYqDWwH+C196qRU8pHzBZVJhhwzpd9mwH/n/l
	t6jTQje1Z8NMCeZTrx5UXR7VaeJanhYmwnvfWfQFSNQPyfeplHymxCpdk92Oi5iA
	X1KA89i6kUS3t9mCtzBYai3aseimxWYadyXtiPzl6bdT9dvjAWS17aakMMKI6o8E
	AXAy+ENC/VZ5nDE3g1BxNmEWPFKZLagcPnDotRnMhsoK6xCLtNfjoSbBfwYNQ92z
	3L11sFXAbM8EXoKx2kYheR0IR0mhgOgjoIoBOxCJGYCQzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayah3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 03:41:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fed0652bso5771985ad.2
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 20:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789616502; x=1790221302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5C8wjP4LGLq/ehI6YaOhoiRmBukehjstLcbOo1B3qM=;
        b=NbLberWqtJYKv+HqLZDItfWUd2V26KJB0AtdtCCBn1r3yaBgGem2qM2t/fCTwIkTCa
         ntF1dZVhi527FRuxJJtuCSMPg779A137rh5sUhq6tE2zFe4gLtHvbJ0CAtsylk48e0Xk
         CAx+85fNOksVC2P9UjLbTSi/ui/JYdIBYVdsXBuIs9aEiK0hKm9T1uzDN5sX2wq2eUrY
         08H37RqOQqOavR0UOkSMreQYGb3rdcWar5CTDvxaCY5N2uCyfMO7IxQSCABA4rA1BDG8
         L5qm1hNfeYH+cw4B6pVjKTmRlO3sBS6IvzlZUTCov27+rBemdgSFACMDR3i7zN+YbFjX
         KCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789616502; x=1790221302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5C8wjP4LGLq/ehI6YaOhoiRmBukehjstLcbOo1B3qM=;
        b=xscZyHVuswg7lbl6GfHZtaP/Z9dcTBpgGZkBX0BwYRZrpvHHtd5my8WMzd/SymKMrN
         xdYo07FEG7VnKXaiRfyQzWNBHBrMmSGWSbKfckWjhCVUHWCeHenSNBDewQ/f/nmIoYni
         IjRiBI2ELfgs/YfgxkS/AXBnbCUaCE+bKrKQAqaXdGwxu1pGUB91cQ5n+LZNO2XI6bsl
         v/wnLqSIj+WRee8LQ5sD7PJDF9uWw7ssEe2l8huvbDBOIr1gx1ex7pf4XAjycdEGY1e2
         taISPW1s8KWybkulxcyAvsS6uyk4yhD/nXzFlx2cXhtNRzGY9ADdtMlqdcduAkAeC+Nk
         o0+A==
X-Forwarded-Encrypted: i=1; AKwUvBxy1LWIZj/nujnZqXzfwI8ByiLOyWp9DmfUj5C9MusjD2tSHnqt8SPPEyf8vvxJFhBN53dLqtWlF04=@vger.kernel.org
X-Gm-Message-State: AFuF++llNVlLLyZ+mZmS5JMWLqSf7TD0tg17CJdYQO4Oj6ln03r/ezRB
	lr/GusNUl0LH3VI+1468vSEYeWIdf0i+P1JBuAemoKeaFTZfgR7zuD3yV0B+OA8cOyopCP04DJV
	g+qZ2Q/Ie9EJMjCi8nk9DOmZrMa2i93DmgtQilEqzSIXFdFeIgT9FGmkwA/WD+AE=
X-Gm-Gg: AYBFou2wStZ1r7Va87V9vAGnmd0LxqkGMVy5JkhrlJdR/MkaVnJi96iNiezH0sNOgPM
	UaGJKqnTgCnsT6zKnBT9X7ZtSF53oRQl4c73ccwttvBUzS05UShWjfJK5/7DMpQZJjdM2t27KsI
	UnoEiCBT8kOBoeyDzxWBfFR7u5QEE3A51eYTpW1sAbrYp71QUd1b1yZ4bZn5q7uDMPRNBuqkyBv
	E8KHsM8mMtottlCDEFUL92B0Cn3MWIZpsqxsU9dEkkBEr7X8CW/cwmB4hBN3EskVL+ZRkxnHVLk
	573kHDPe3YpNPfmAuH+umzYFADzy9TDp+Y7BZfEuVcMRSdGl93D5F7pvxecOkE5xn/LV5SPPeV0
	NstUWkh6PM4x/cOdXLTBH2SaogIX/zOFzBoWZ7s13Jlk=
X-Received: by 2002:a17:902:cf03:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd8e77cddcmr113408615ad.22.1789616501752;
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd8e77cddcmr113408045ad.22.1789616501347;
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm22826369eec.23.2026.09.16.20.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:41:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA
 engine
Message-ID: <aqthb96f2zj_dlK5@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0MyBTYWx0ZWRfX1vvYkF/QCgPc
 f1Q8WhtnT8dlSNdGGf/vZCjxqgF+BoYbb5c0NVYI9TVkErbLLjGDscdYoyAGgulYvKuLKMMITsu
 lxwQavyOf3czpHOhzY5Zz/2KLydaSdQVsOJU8F8OVqGSOwSvyqL+m2/jO/pEtb4M7srgKwRWOWs
 uXU8RvmtDEDubqWQ9FFHCIA2sySI8e0P1UVNTkD1m1g1qimkwGB3MneD9ITJvvy/s5C0VNdRd35
 JGw03hrQuHOtqPtaAziAQ+em1kvfXRs1aJ+lBqxSB50OIMfvRG12pqb4FeHJa2aFV9SpZUQmfaz
 kavsDJDZh7uVt3k2LboCY1CKDcEuG1dhC5MFXRANH0EoeCFkg9fZ0+HqudtS1E8Yx+ZEupxQDZO
 RQVRMqlMziwwY8Hg4oL2u+/Cw6z2tnojjnEK1RyPzr9lhtEkeIi1QJ69rOKvUal+nOkgrVxOwR2
 lPu6U8R1/KqHh7j7dwA==
X-Proofpoint-GUID: O495Ne7G6E7FNYgo0dlhZpS5nWosoT8O
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab6176 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yOFVgSGORKUhaciPrRkA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: O495Ne7G6E7FNYgo0dlhZpS5nWosoT8O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0MyBTYWx0ZWRfXw4sgONHgIv7x
 lCJ+RDofVAPJ2bVSZ4rs7UOi01fpPwrNVLvE2DCKmCZV2O9lSU9Qrm41AeyfVWFuwubcudT/rtr
 IAcZDg662sowUa12xN/D2CnbJgrhhRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170043

On Wed, Sep 16, 2026 at 05:21:29PM +0200, Bartosz Golaszewski wrote:
> Add the compatible string for the GPI DMA engine found on the Nord
> family of SoCs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
