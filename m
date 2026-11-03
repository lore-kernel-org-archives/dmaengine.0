Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793740132;
	b=LiLa7cYAJ/Bm7cpWEAD+8bjYg051CX7j1wj8RUCdK4mIb5e7yZUUYKavspae87PWQM9e
	 JFMsURbUVHGByG4hdp+s0pxlDgUNyF4GdwKQ/XZTnoKjfVuy2pZVFZtNfKUiCaYEVrSU2
	 9EXiNnMfD7sPXUzvLcQfD/OyLcmLdDjS6xBPfQI2Vrs8CIGfgC0tkZHrDkbqFBXxZXobD
	 Inw9wpbTe0R89+Tuc54CkaD1W3GoToiZ5U3izXKdu3yDJB1gjpekHp+lQdXthNiJRODfu
	 +PXSLjHu4Sx2bJ+wxHFxhevIW5tu0ZjjTY4otcb8iPVPv+i3ei5qaQt60yZ73xnHEqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=;
	b=tcDx9LyZ2YsU5fUoggesjWkNNoZHxs3YnAlb1SvfgwPiJT8MZO0I4VqWmUBOeLD9uPgU
	 5sdZX3zqd2Trl5Nzgq2+DjT2bPgHyHsbOo8G3xPdP/FMEw0DtFqn7DuK1XtituanmLcnf
	 ziVZI05bJs0b1omtnzQeg/RNaDzErBkBGx6Ez7TlTP1kHGJ/yo6lfd7IAoAnqcP4pjvk4
	 WZ93yPuRaP8vlZTM6l/UvhLymshlo84dghpsTZYZp5YdAqpCkOWOE3CcRJpsSe6t3fdZo
	 XjW5n6xmTcxf0be24+AEzo9hu49jwz3AxwMT1kYpUxABM3Be3B9S/BqRsbFm6cbqg7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d19wo7gv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4ZQuWL8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5265606A31B
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 21:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5265606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d19wo7gv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4ZQuWL8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZIU93666648
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 21:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=; b=d19wo7gvSskyJQtj
	zn04v+tx++jgkYt9Qj3cAJXvlgXV3Cw5+iqSdFqauPrwz43fXfVRpO/fPUEdYHfR
	lMZXWimqC7YCDZyC2i5j1lckR15gAHs+TZpOj0+lBBualPVy+7PPATGPhJOAlcZ9
	DAPOoMLFRRZUBrP6kgsKzuw4IZgl4jDopwcfMXLs95lcvlaSc/d7Vqds+CCiaafo
	N8m1ziwS/8lzMMCkvJrvqYOEeMEJHG2Is6G3UCCsTu0cWD3BO/zzfskc7cFopaTW
	avAtwGUCSzzcElg30NazHEu5oC0TDKWpUx/zI/NPtiKrnEuEISsT3cGolU4LS3TD
	i6lqLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubh922-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 21:08:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8e16d22d8so66854905ad.1
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 13:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793740125; cv=none;
        d=google.com; s=arc-20260327;
        b=LTGsY2u7kEae5/RG1XFk3f+LQcEqC0m2JpZUmFe5fDoQWBvJqo/rTpiWIKKKKEqhOT
         DpAMr+/Sp5ANK8ihiUIwt8yYOuz9mYYYk4gvVHjFkGantbOSqJOA6ys+V9MMPAxNZdNg
         CioJXrzhg/FmkRFE3gZ2Z8QbqMCjFKVMW/t2NP5ihGI9nYES3JVS/YptEQOTv+Ynilfy
         6SAxRUH7OBXY+IX0H5v4DVM8DsNWjtRC+OusNFPl4/LWYU+aVGLyj36DjrOfHfEuI+92
         +QxzA+B7Tkgb4s4PhtxignFyrL1WWxJGmvSG6wM5PaK4aZMmDub8IkIxWHpwjyW9UJHE
         06Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=;
        fh=3aYqm8TnGCipaKNh0wBDdbOjKIaOHypJxcILGan/5+w=;
        b=UkVMeM0o28N3Kq0ZaxKOKaefOQM/8ay81tev1KZHPcFIBBdpdf7cWitPYHn8lGcuRU
         ESRQuWQPMMzWxkaFNPTwa7mEBb5+aJHLEuPtGsesMZ7dXh0OzdOfutb0EnGzdiUiEbmz
         niJeWrt35XZBg5KnScWKtNvHpUaAMKj4+34a8l6ii9EnGKFHpVZWYH5/nzHPePh+odew
         LmUQD7JOTCMyiAExHbYmDgBguiazzAIutXJC5ZNMVi14FqoTu9p/JXkZbZggVSAVH+Uk
         m8qrg/ju6SmVliii7MauQ6l/T8Y36dC748z4XhZj/cVLuPlYLJNEbMQkdwWXI9dBCY9m
         7/hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793740125; x=1794344925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=;
        b=U4ZQuWL8VkMrSEoloKaedfdbfRwUjR8An8rhZ0Xwewv970HcmQTtrnssSiAFu1FSOI
         8lFNExDAkHfqNCmv6GvS/ZTs9kXg6cK7ayRDMM7/go4WgwrRmGcmkkFfs1T2OxrPjmX4
         4uBv1KQjKv3i3U+CFTMRCd2vAAzyAMwF2fklqqurGuPE37e3IVVjmeessTXXtWtXGnQl
         +qaBztSrIhg9/Zy/hTMlUBNZbYySVPL0fdlb5GoGRlm1J69M2L6ZXhW9FbcvRmuhl1Lu
         yKMA6i8vDMS51zf+6r3lRIe23CY6WElaMggqNXjBBejIy7j6UOv6kIhWG/YXNeJkosrq
         nTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740125; x=1794344925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=;
        b=YEROA/zRkDRNLjhmu+MgDcS2ZVTLOJKT6iAHohqKSJZgcdiVF6Kcg6et22AuATXOFl
         m/kjVzWN53nQTCdUuw84UCsEnNGQ2FU/kLfe0/NQL+jLni9Lowel/Kmykl8wELGUuJ9c
         N2R/R4+4ISNlWtCbhOZm9M5D5pWS+/qcaPEJCpLrWqZpdMEGC3dVT2vbEMsC0t14nj5e
         6VgbglH6aemLXD84gfl8UE44F36t64ism8dvmtlpgu0wLD/PAWBABEn3YwDAwTgzGjJQ
         PzkXWZrGvVuqSpgNLZx/UvD6ZycAQmT+DSUFph5dPI9OVGgPAvnfik5fiK7LCDzTxNrY
         UyBw==
X-Forwarded-Encrypted: i=1; AKwUvBxJJmTQw+hETkTlPS+y7AgDa36jgt7I7ofd+7K4QxagWF2rVnucIx5gonWFbNPo4Q+GzoRlLhIszbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qAYjhz+SqSX7ZLwBtf1JrrJMKMAZ4AiDYPv5PsTme/tIvkmMl
	PwALw2Nz2Bz5g3YptWLofxGc3kdWaTVVC0DrakdFAtInzaa7BSlOR/Vut+rnpOx6Zsauyww0Gg+
	OwN9lVnX1m669EsVfYZDG3x8IEdLW0HKjo4N5leaSzcWnZY3dlRo7n9N6hCR5hKQU4S7OCS5YQB
	a0vQXeO5QPQiXMkCphDrtElWEF2mMNMc6GDVdlPw==
X-Gm-Gg: AYBFou1VAxRaWbwhmygwmn7YOId2VBvQlywcy11SfJ9Vf+v84fwm4B43++xz2c8wacl
	bnGEx+nRMId9njL+P/HldMnj7u8gFv/UlsQnThI/nBIp4BK3qTPpfHfDGz2LCV5iYSWwSjNjtjT
	kt7GImuIM/11SKlo1QyR2PtBZ1cppjfLM/Mjca3KidtmyoVEPH0edtHkItDY4=
X-Received: by 2002:a17:902:f542:b0:2e9:9263:a5f with SMTP id d9443c01a7336-2eb36493707mr131781355ad.17.1793740124596;
        Tue, 03 Nov 2026 13:08:44 -0800 (PST)
X-Received: by 2002:a17:902:f542:b0:2e9:9263:a5f with SMTP id
 d9443c01a7336-2eb36493707mr131781035ad.17.1793740124147; Tue, 03 Nov 2026
 13:08:44 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
 <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com> <CAD++jLkC7XehyM3Qh4mDu1zB+_MKhmFn6ae1sA4XCxeS1btT9g@mail.gmail.com>
In-Reply-To: <CAD++jLkC7XehyM3Qh4mDu1zB+_MKhmFn6ae1sA4XCxeS1btT9g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 22:08:33 +0100
X-Gm-Features: AclHuK986C4IgEa_un_uJ2N3V7r60Yd74MfgWjVPHQJYngYAYIhlhA3cS1R7Hj0
Message-ID: <CAPx+jO-=OXpTY7no36tLoKh52EyscohYqtwD64xsgAc4Sh-g8w@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NCBTYWx0ZWRfX7w/SpsS/7tLv
 Cyv51Vm7qIqpZwJkNBFO2kA44TfzM130a2kAWS2bJQqYZ11VRmoNm4s69lZojTT/puYweuvu4ts
 S6JFIs+yRZQXxknwfvaaEoEMeZezvKQ=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea4d5d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=neScOegWvRHQb6aK0P8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jGfA1ISLoj_sRDPbojQJxAv-n8Vdmrj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NCBTYWx0ZWRfX+oq20NZt6nP4
 MTlOmZxg3Xs3AXLh/KMalDTVD2kLASMpmPb21CJSSEoqVFpO09uuxRIxJz76WUZ8AiWlQ8jCCU3
 8yW9ol8IQCG9CfhCu5xTAAcL0SD0oiCSYhIY8zEaW1/BjlZ3cg6TSr2c3eVJTp0hl+SVUg7jmU9
 VVDJT06HqCcFkVrKuTgCUvmLJZphvFK9ZisXQ2GTAcqNKOtECyKRaqpu95am9HlNR66Rghq2LfX
 lHnZX97fZZzId2opJRGo0o02lqXgqVw44QKfZ36S2Kya3Vfyg4tkEp0PWdKSMONOJ+UnPymnx2Y
 n6NXx2w0qqPzfcwHfDKzgNustLQ2GeiQKksdtJ4qWG7kITCTfbb1OfiERrSTojCgPnQSAwQELvx
 7HuuQY4y6K0JLktV2IBRZx2306v0OIdWgfW1/nRVkvra8YvytjjweoBDgUgkYGdgDIPv8eBzGcB
 upVIgkyJ9RIkBde1u0Q==
X-Proofpoint-ORIG-GUID: jGfA1ISLoj_sRDPbojQJxAv-n8Vdmrj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030084

On Mon, Nov 2, 2026 at 11:12=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Thu, Sep 24, 2026 at 3:27=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
>
> > > Hold that domain while DMA transfers are active. The DMA controller i=
s
> > > runtime PM IRQ-safe, so keep taking explicit LCLA runtime PM referenc=
es
> > > from the descriptor preparation path instead of relying on a runtime =
PM
> > > device link from the atomic transfer path.
> >
> > A bit of an orthogonal problem, but related to the above. The irqsafe
> > thing have been discussed in the past for DMA controller drivers.
> >
> > Would it possible to get rid of the irqsafe configuration for the dma
> > controller device, altogether?
> >
> > I don't recall exactly, but not the entire consumer DMA API is allowed
> > to be called in atomic context, but perhaps that is not sufficient to
> > allow us to drop the irqsafe configuration for the DMA controller
> > device?
> >
> > If not, I wonder if the consumer of the DMA (like an mmc controller)
> > should be assigned as a consumer device (using device links and
> > DL_FLAG_PM_RUNTIME) of the DMA controller device. In this way, the
> > consumer (mmc) would be able to control the supplier (DMA) through the
> > device link directly using runtime PM. This could potentially avoid
> > the requirement of having to use irqsafe for the DMA controller
> > device. Maybe someone already tried this?
> >
> > If the irqsafe configuration can be dropped, in some way or the other,
> > this patch could become less intrusive, as all that would be needed is
> > to create a device link to sram device using DL_FLAG_PM_RUNTIME.
>
> I looked at it a bit, talked to the AI prompt a bit, thought about it fro=
m
> my (limited) understanding and while it seems possible it will need a
> substantial amount of work, so I think it's best to get this powerdomain
> migration in place first.
>
> Steps to actually go there would include getting proper consumer links
> in place and verified, remove all atomic resume runpaths in the
> DMAengine, handle requests without a device such as memcpy (I guess
> by simply using the DMA device itself as device link?) and some minor
> refactorings of lifetime for channel setup/teardown.

Okay, so it seems like it may be better to revisit this later on then.
No objections from my side!

>
> But indeed we could use the pretty well documented and supported
> U8500 platform as a canary, I think you have access to this platform
> too, the upside is that it is "simple" compared to some recent SoC
> monsters so it could be an example of how to do stuff.

Yeah, that could be a good candidate for doing this. Let's see if
someone get to that then. :-)

>
> I don't see much generalizable stuff apart from things like the
> pd-patch to the SRAM driver being pretty generic.
>
> Yours,
> Linus Walleij

Kind regards
Uffe
