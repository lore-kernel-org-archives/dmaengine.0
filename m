Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722B73C13FB
	for <dmaengine@vger.kernel.org>; Thu,  4 Jun 2026 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569925; cv=none; b=LAd8QjiViZvMjq6eK+XbT58HWBA9X36LKFeQ2XOS0X3Euqjx3pOtvnCCfvon85MAwxDK7BayQ7n0tbbIdncazlUweqHtdCZHmJYDRlv18ei0SYeIK3Eukfm1Gb8YB2IWgSHZPJZ/Z9KCbMhs+P35cunG+k6gbPpL6xTp1CgRzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569925; c=relaxed/simple;
	bh=M8oUBwMoJrg18/xT45KX6GsBOIdZg94wj46SfP7dTMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3coHaTv7sioI7YDFOasfwQd1gzi5IADkDEWjDoWquRxcWlT0NJmjOiupxJDj11b7ECSTfzWcFvW5upQuJswxkbTv2izXBxvDApIkIXYE9Fa5X46eAzQGatc+1LiLv652JJxJjVu7gj9M9g7Iy2xSVOp3wynWG9ASk8RZbkm7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASCFsNoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsliazwD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASCFsNoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsliazwD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548CPBu598076
	for <dmaengine@vger.kernel.org>; Thu, 4 Jun 2026 10:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M8oUBwMoJrg18/xT45KX6GsB
	OIdZg94wj46SfP7dTMM=; b=ASCFsNoAfwgAqepX7yt4vzpu0Mrf22IPQrntFazm
	kcRPZC4xF/sTwZRincntkeYYJxLGL4OWzvAkuxtp6r31I4CfDGXL12oo15l5l3Ic
	bjuLH6CoEH1vL2qJYJLkvY7bQ8t/2GaA+AvKIvAeZ1RsIYcpj4P2tkFhfKmYLKSF
	+LZ5bb4eZFZ5/UF5r+sWCXsT1L33djmSs5a4Q0T1JPSPBluYWITIa7HQQxOnr3Nc
	IS1oAquCBfplYbiLtq826mHF18waBICCWhyJtUzPlJLxOEOAS9hlN23F2ozhyodQ
	tWO/039CY6P9tDvYsOM0LGdv2wpdvnzN+VsqogJ3WkIhSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m1wvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 04 Jun 2026 10:45:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so7584215ad.1
        for <dmaengine@vger.kernel.org>; Thu, 04 Jun 2026 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780569923; x=1781174723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8oUBwMoJrg18/xT45KX6GsBOIdZg94wj46SfP7dTMM=;
        b=SsliazwD98CPtFwyXNayVUJ2z2XwwoHOcD6CTf5sM73xvWTAFCsMJRz91oa7q7JvWP
         8AEvXgpZKNxqcDE/nMIPMsmqif2c6oqNleEOOAO3W0uoOEpy9b7L1lBDanVlBaJ8pJzz
         ClhJ/g23HExrDlLLZdUceA/gWv2Zcol5TxheO/JzWmHwTnaOWT9NyKJGx3IWk4GjWoxB
         QcX8hOB7kwpkVdP/136dRaaPqfK6LGBElJFq7rcNmbeuU4NSzW4e+NHDtPWEK1g/yLyw
         52nJTqp26wqqrKMsPTHXB2MaQ5xjrYfzQlc7dY42Dx/0ZSjwJ4KUZGPuAta4N2zy1HFv
         BH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780569923; x=1781174723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8oUBwMoJrg18/xT45KX6GsBOIdZg94wj46SfP7dTMM=;
        b=DygcqPzB2oxcSCV/4/x0IM2M7D+TN29AIvi+rI9hvG0u5hyMikeqcqunLbpwNCWgbM
         9z4Mum6KEX1fs4GCazbZG2SMq+RuTIwF1ReOO/DOjHPe6euDYRqXv1RkbftfvwraGzXz
         VOStXzpmUzL1h23/iDdL2aFKlPUS/h5tnCIEjpkQpCQ0y2hQWweRwHUpWBiTBWzGk6IC
         J2NQ4BXG+lKzf2yl7J/5QFC45Y2eGmI4TQNHEtO+pED+dbLnnW1+ybcAIVBL6zZ6h7we
         NxMrxJ8lu5uqGxUoUBCwm2r+/HPBMXtUDLsEhUL3Dhb8E9aagpn1+0IIOlK9viDvYOev
         3hSg==
X-Forwarded-Encrypted: i=1; AFNElJ/uPK/jC7kezlgvAz2ihpWTK8Nm4/qjujC6o09B9rm7BCXEulNV37sfn9YgLr9p1RZvUk9Lf9Qz1DU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1DUuHXgJt1YENeUavtXg7p2VIk7XQ5L+6gNOFygHU94t4ly02
	ZpUwaAKNDCR2oAvtToshU/SvChtWcrjhIFLQcBOh8AYQ2FA5VzVp5WeJuiyjQwSeXX6tkcHYLz4
	1KqTlqooBRIbCgQIvWLJftEWeJPUDYt4CpsOEd9NUJiTN75FtiRKYzbpFiPu7p94=
X-Gm-Gg: Acq92OEFMQzYk17MggmYZm8kppZMM5jFeuiot4plG2ElwTQBzZOUIJeJgxJRC5A/YGp
	Ajgv+QD1CfBp0zFr7SdC+VPpVO8VL+hHZssWcwyWKf5f+Mhe7eXsqmXTDgev3tF5xSJ13MfXtlC
	ryfQoTKe3NAgJrDJpWPAdB6ILr7g/M8f4Kl9tLSBISdohh5G5OQH8aGMwZnCUyDPEJwmt2SnWBI
	qb66Xc1/PK3v0aoUHVqePyzB2MzSBwOdoiIsGHQCfqOhq4CVbmjDDY9GGTPFSGi/Z8T+sudSMPB
	+pVFybfGR/dtOxxO5xS6rmP6049p6nhPiO8FDus50V92BfdDiyIYJ2SHt3s6IWNXNxH0CGFT9Im
	2m0YnbqpigcgoYO8IBGjqUk7HZuot0dZUdq5/Iz/4OpVGw/B3aSp8AYAH0YofmYv14OPsCkKFfr
	CMyX+yUC/vQvfEahlIsS3TJ13M8B0LsUqrOt28S9LI92CSquMU3H5NzHD0ho+UGw==
X-Received: by 2002:a17:903:1b64:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c163d85f20mr74272655ad.20.1780569923099;
        Thu, 04 Jun 2026 03:45:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b64:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c163d85f20mr74272415ad.20.1780569922622;
        Thu, 04 Jun 2026 03:45:22 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm54701935ad.80.2026.06.04.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:45:22 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:15:16 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        mani@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Md Sadre Alam <md.alam@oss.qualcomm.com>, lakshmi.d@oss.qualcomm.com
Subject: Re: [PATCH v5] dma: qcom: bam_dma: Fix command element mask field
 for BAM v1.6.0+
Message-ID: <aiFXPPXtjCHj0Ged@hu-varada-blr.qualcomm.com>
References: <20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com>
 <agyeh4PZwG0Mu6Wx@vaman>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agyeh4PZwG0Mu6Wx@vaman>
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a215743 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jG7jI5RKT-kwyRtthR8A:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEwMiBTYWx0ZWRfX7dV0t8K+2hCI
 qAk+LliLbaBzy1vG5sigcI4wgqasYAykE+0cA7HKgn25ILMnpmmqThxrehSh0hxkMcvkZy6sqgS
 EvcYJpitIV1+j2CL8KQaLhqzF55BNMFFjld8BKkJBvQQZdRCnf2d+E/VV3qnO+pqiy9dKIs8aAT
 OL4ro51noYDnqxWXHW8NJ2XWOudw9Ai8OXYNLfSGteogZjzsZC2YUwE0wTgq4MTwXi/CzpXCTNk
 O3CW5VoivuT/B4FFviAe0itNTA2+UHA/ZvUZULUGZSmvHgT2SiKHA5NQBCOIe5XBT+cXxeva/+6
 HW6W0mKfyfAqyMjdRHvJTDb5HJGnLs3CkTvwtvqvo7g4HmJelzb28kTBsLxklZQW3AUF8KaOEZO
 hR5Ia7OtfLKOscgmrQyRO3ZYuosspU36tYqix0XEOCF+/Px+lYCsIF/e7Uvrc5UvIMtblof8+sR
 6Phk/qApgjurJPqf7gA==
X-Proofpoint-GUID: iRKNlU9phqIQDGVs1Oaxg8EYGPqypYML
X-Proofpoint-ORIG-GUID: iRKNlU9phqIQDGVs1Oaxg8EYGPqypYML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040102

On Tue, May 19, 2026 at 11:01:51PM +0530, Vinod Koul wrote:
> On 14-05-26, 12:09, Varadarajan Narayanan wrote:
> > From: Md Sadre Alam <md.alam@oss.qualcomm.com>
> >
> > BAM version 1.6.0 and later changed the behavior of the mask field in
> > command elements for read operations. In newer BAM versions, the mask
> > field for read commands contains the upper 4 bits of the destination
> > address to support 36-bit addressing, while for write commands it
> > continues to function as a traditional write mask.
>
> But this changes behaviour for all versions. What happens to folks on older
> versions, wont this break for them, if not what am I missing

Md Alam,

Can you please respond to Vinod's query.

-Varada

[ . . . ]
