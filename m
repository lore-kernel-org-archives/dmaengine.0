Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3274D37A2
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556702; cv=pass; b=YR0OWHS/ewgSg+2VppG60R9fSqHLaoY/9H/jp4k2h1iTiN4r8M3gnXUj8puxP41P00TEeB25J936jaM1kiILaFvr5ZuJeDQy602+UawPT6vvAmc3Cc0+NCQsHF8UkdIx2v9OpdL48c4VzUMqoOPXa3n1AdS/4u/Y2CoSBjx2NRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556702; c=relaxed/simple;
	bh=hiUOs3lVj64YP+qgdg+X3u1xuQjJYN6lKLOGoKrayZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHRDGhwkhm9NcmPqw/QMKhmE3lUyI+mIF9n38GoZDWC7xVthelFFLND8PgAg9HHKFOMvI5kI0KVvE3SLIeXjixWWnTdUZdPJv9KtQA4ZUYocrTtwTNmTvfBXDNraUhbBTMA2sYheSxpfletPSHr3RRspf+f/XWw7gr8cW0Tb2mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbYUQwuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Agb9dJ9z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbYUQwuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Agb9dJ9z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Dkpeh2362202
	for <dmaengine@vger.kernel.org>; Fri, 9 Oct 2026 14:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=; b=VbYUQwuJPCbtoeVX
	m7otJFYOvB2nJ/0eD5rMovP6i9TEsL9EsY+aAjWGwu4BLzi+Cow5JCrCB0CpVwpc
	KCqXEBJThkepkP4ptknCDiKzHIua9stKQaMJCjZ2OedHblO1CwJtlYJe5tyV9rpu
	zuH+iDR3Gu/xBamKr5oMgVhPrcqdRvt9a6NZNcjuUgHnC/Nzg262hRdLYGi+Lh06
	YBh4CgVsDbBkT7VgKX38+3M/mXE1SkgvkmZY007Urf4ET0KiRlXMmeMGuIl3ut8G
	4IeuA77qbU7JY5aafiRsZCu/gCck2jBsIXIWm8E1ufCYrq96pI5kCmefSMsxzfrZ
	bOVO0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f2g73s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 14:38:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so8547957a91.3
        for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 07:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556698; cv=none;
        d=google.com; s=arc-20260327;
        b=RfMJFleDGaYZhp9itpt0ayfD+kRmlCVNv8avcJrYJ0ZnrtCrbnJd0yXa0UXk7DdmSE
         02rLaLCjU+Tcclm/dsG+gTvVy7s2kbIFT6JvjCCQwYoPqKUUn2B5vfx2RdjJLWOlODM7
         pAJGIZfJ49fGYKGsAtzgiBAGzV5GAE5DKNgCWb9cR530jt2VdNFzp5aWDFn1wj4U63qw
         Y+70wuDQLrriYKNDjKKA83NJyWcGgXfcu8eIqKBuQ12tQ9AUmoucWMnBYUIq6l0YUz+g
         G4s3QQoN6jJYIbAbTM/dSB9OPtQKrPKRsydwsWqfcb3kfI7iCb9eCm+9vecmrMxANLqr
         xSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        fh=12fCVcAmuJKXj7uP2XyvkcJ8P3J2fyenB8Hd/5wT0co=;
        b=UtAujlnyGsuCwOjEg4hIvORsljsZL/UyRI9BJrw+xW7JpwL2zjgF38iJbk+ieYSak3
         0bvRyPAA2fM2SVYKIZPEonm4fkkmP4WL4+vwOeeTg9/jbn8s4YVbn5LwB1yYExgNY33Y
         gNYy4BnzqS5QVVjHu0dDY3KkZezTSI0CGD3LCCcfKj3gMTscYJigsdo5p912UYUISnc4
         oAFapoO3bdCucxrMpinzlmjDmkxxkMzKKv+E8PiQQbc9kQNhPVU5RtPjqlxqXDqaRtVC
         mCrKeo2N7AFbbEfMUsROLV8G1pY3eq9srec/loxqTlzLVFuGW7WBoAMMGjtGEOrtDH5w
         9+xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556698; x=1792161498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        b=Agb9dJ9zDfjMeGpbVABH+YuedQhIrHExcvPQzIZZk1I7pt6YXZA1QvTCuHRenMVkBR
         Cl7LxVf1eQ1b8avs8T9QwSALAcsCXOpxxrT9nTvWY71OHXobr4YGTvv9K7nr52bgy0Gl
         y8ZU9qdXMmO+QkYDs5fvx7auhlVx6nsvRhxopwsudZvOdIwYL/cB8YH61Zm84ySrq5hb
         fPX51h9KCe8tV74K8OnjC0CDymhXSIR6fJOG0cmpOH9EQ2Lhz02pVwqwJ1YG8IgIeaad
         Y0A5c/ssugyy818/m+96PwLQwNbhxXPppRSdgjBRZMWm0HwaT4GvUjZJ00v9e3G16mGx
         EyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556698; x=1792161498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        b=h8pxcwREevc4FppKjRiVBAT5srI8yzJiDMJR/8P4TSk3E6ZMUnUgNLQ0FVGY/+YGpI
         KW/NxXtyHx8mCVELhw8UppD3wWa/G2vEDypJp6VNvdMcxtqrGKVrMwIVUNWaqW3cXvhv
         lokhG51KPUde/i+reZaEe6ETNbWq/A+QrVtWpTAuuX77I81GPtyxfmGo3/qtMqIQgIIx
         EZ1hOXfLuB/3ckuPGKaGPjoeZH7h5MRI4a34cK8/LioY+0r1Lp/8Q+fG9GMb2c7QIouN
         wFukBcgDvWnjnLwqxtpjZC6ijc2nedZfLupnYLn1itTOV6U6Fc2pko5741kiyyPZUyFx
         6HCw==
X-Forwarded-Encrypted: i=1; AKwUvBw6hzidWCSMy6s5YRjUfnx7n5XszJ6WKl11Gmc9672YCWLvh3KTTH+savOygPuVP8cDCEUJ9r/VV7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiCHX+f9Rk9FFm38TGmFSl8+wVwdZvevb7nq8Y99X7HJk/nPJO
	7oEEtfHT1ps/l9K1KGVTpHCRiJO+mU2eT9PFOwILmOY8KyDCEpA4TyMqTU2iYFSwvfBHbG02ZWq
	SL46n19E2Yr3u2YNZ7r4euiwuBA4zgOi2VvpKc0vPpvt2lid3mV3hLhg/pbNH3ERnB2CA1sXzEj
	90LE7b5vjazQHt0i+SwOvVCmWSylla+bFlwjObqg==
X-Gm-Gg: AYBFou16yWmUA5WA0ZqNJiYNh26ibysZbIHdzAPM4LvyP0EPgKwjJ6gvpMKUkffZZJX
	UqsuukfE3Ww45TEO7NEFJ6X3PY+jt/JcwcIg7xztexh7JMN2TtDs+Lmo1yG8aFrr0ZuhxGbDxfR
	uGHdBll3QOkg2fxqauxl2PF8GvMDYSodIuTTJJnVSxP5IB+8phXcSxpOI7sQ==
X-Received: by 2002:a17:90b:1e41:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ab3a96ffd7mr2186020a91.59.1791556698428;
        Fri, 09 Oct 2026 07:38:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:3a8:9b79:e6ea with SMTP id
 98e67ed59e1d1-3ab3a96ffd7mr2185985a91.59.1791556697914; Fri, 09 Oct 2026
 07:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
 <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
 <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com> <20261009131902.GA1195061-robh@kernel.org>
In-Reply-To: <20261009131902.GA1195061-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:38:06 +0200
X-Gm-Features: AclHuK-dvh3nBN-NbcFTG0ZbDjXuEqk09evXIZaWdeTMn5nwqDOFCebwqJJJ9Ag
Message-ID: <CAPx+jO9F6wUG9M_cV-xiF-KAKD5kJ02n+yE6L9vocs=KWaKFTw@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power domains
To: Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6m6NgRrvn2mFxmRW2R0GU2BzIM4vCk-o
X-Authority-Analysis: v=2.4 cv=GpbXaU1C c=1 sm=1 tr=0 ts=6ac8fc5c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=sRttis5sQqJQ8Uet4gEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX3XtQkRTEdBL+
 /vh1Y7zLA8d0tjoCMK5w0i09gB0JcsL1LJUwTr1zQTbTZRN+XuJcmgHuu5OPz5niM6aL8P62MQV
 xQ2QI7CoSg7g9zK5CylP1ITU0zV575E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX5JKgDFpKxuMX
 MVeu9tJBxbQIldRD4oVaDaPDPdO+4h3fIDf+0Z7etSDG4Aq2nlYYDVUTYV5uCQFYDMizEN9ObX5
 CldQTp7TX25WOil2BDdqamQtUXX6s26x6+31hle6hREjF/IIGPQNK9QGMnx2XgAvv8Ba5EkEDos
 T0rQCrQf+1aAevJzpL/ixIbwGp9N9XuQQOn5YTkAfmutsXG9R4lCg9BWUa4IOMLW9/6Ys7PmevF
 Dsh4BZ0Yh7c2MQ72YjwtlTQEy8FPHAhOFthV7FfK5Ul8YNaooid0ajoungPiUsWJxJpI0suPAq1
 VLqJizfb9ueqNn5nABlVMVMk0nDF/2XrdYRvAD6SgmssCmgnzklA0m/ogXs5mMW+vUAOvqsD7GQ
 VIN6FQs1sPe0tGhpQnZfIrrk03X0omAg2SayLddw65CcqMHjWk0OuC6xZ9W0hcuH7AWfmY0XLj4
 rA6dtjnVCbOvaOkEPgg==
X-Proofpoint-GUID: 6m6NgRrvn2mFxmRW2R0GU2BzIM4vCk-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090058

On Fri, Oct 9, 2026 at 3:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 09, 2026 at 07:05:46AM +0200, Linus Walleij wrote:
> > On Thu, Oct 8, 2026 at 7:41=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > > > +      power-domains =3D <&pm_domains DOMAIN_B2R2_MCDE>;
> > >
> > > This patch is in next, but the define is not breaking dt_binding_chec=
k.
> >
> > I screwed up, I forgot the dependency on the new define :(
> >
> > I asked Ulf to merge the prerequisite which would resolve it:
> > https://lore.kernel.org/linux-pm/CAD++jL=3DgFt9kKZH9T-m8B_pbwRvzc35tTrM=
n5V238d3528DpUg@mail.gmail.com/
> >
> > Is it very urgent so I should just revert it? I could also just merge
> > the single patch adding the defines into the drm-misc tree if
> > Ulf is OK with that.
>
> 'make dt_binding_check' errors out. That kills my bot for anything based
> on next which is most patches.
>
> You could also just remove the define from the example.
>
> (Note that drm folks require a revert be posted and acked or they will
> revert your revert. I learned the hard way.)
>
> Rob

I have queued up three patches [1] for next from Linus via my pmdomain
tree. The patches are also available for you to pull via my immutable
dt branch. I assume that should resolve this problem?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261009-ux500-power-domains-v7-3-rc1-redux-v1-=
0-5eb1b90bc35e@kernel.org/
