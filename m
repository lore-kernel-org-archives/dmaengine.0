Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19AD3F7882
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221464; cv=pass; b=a4mOOyQFpFFIYwYdmvJn6UTz2VK+3YiESHJmxyoF6l2+/9rQc7rVQFf2E/HsCMACuLPkmqihHd6K/Gzg3lEibsfHI/o6v+icLZkNf/8HCyPejTl1jKuEbR86hFSJ5Uph9gheWzmFup25TW2jyBs56I2xQH6IqC/lwCU0nVFFsC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221464; c=relaxed/simple;
	bh=p2QMU3DTYzx0hJvixVYCYPw8OSsNqcb3xQFG1Mg3X18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPIN+PZu0uiBjdp+F7aYfWhtbFmjlUcI9ee2g/a7iydTqmjx3j9idL3/FwRMeK0DhlV55UlqkuymdPYvyHkZlyzfB35hqHXI9OHcd2UUxlakNAOzmvxU4XK6lqxpTQV1kqBQCwGLh1q3f4e3bzBwKCThsaZ2OMzKCrbAKEpUtBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlB8zap4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkvYKJ95; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlB8zap4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkvYKJ95"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PGdq2465486
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 10:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=; b=NlB8zap4bl1dTpi/
	b77sQXntHv1GfNurcpg1EXnyTgwpZQ+R78j2BoglrlZvcovg72q6QAhNZfrYzcqr
	GCwMe36xIWlsMUYFJg8JYGU7TK6ZgYfMV+pc0lL6XogJV6HWr0LEOLcfyjLsqv1m
	ZNq4SlEiH17wGWg3jha9yW8w706I3uJe4rCwJjbfD5Am7ydlP/iNJjbivrLwrwS+
	x9zOhcGIvabtlfi89CueWIKKke4cwPHsg46q73d9VcaLPyY/MSWxNOaUT6WI97fp
	1du9a25vtOEz36lozAdQyY+2xlVha4vci5E+Etk7h5hFpMtrrVUJvTbcfOsZ8jJD
	DQkAog==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gft8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 10:24:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso2297543b3a.1
        for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 03:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787221461; cv=none;
        d=google.com; s=arc-20260327;
        b=RM39+Z74XfaPsX5J9jcyZ6hl2fsiei/wbjwu+2LYYWa9lhsPI3gVRpC/VLOodCLkyg
         loKP2a7ysbi55aqt0USV4Wrh/7nQScJnM9Mag6mazDl3F9LKnDYEnVS1LCnNYGgMOfPT
         C6dVj+BhRPpYf0pbcZr0hOZvBkSDgnrb9T9EXpDxVR8o7Miw+thOfNjve0odbGi8ifjR
         /pZ/YTpXMptBRrxqP0sP3m6rQwexOncQAigHjUHw/QVRA9DBskjMZJOveubPzBwUfLP4
         rP9093P73HXGNFC0YogbQRg3w8lDxmOpaFJqa7r1+QzY8fMEMUTAGhbZQPAEpOSr7F6h
         97jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        fh=ga4XZBM2uCQ0O6g6JmJBKNE1CQWdRxHvTpD8h3iPdQg=;
        b=gaGBsBEfu7nH12PzohufOzkSr7yInoih9lHhGMk3MlKE+yENLy5AYhSm3Jlpv3rfb9
         iB4RJ4/iRY+yKv/vETZq/TpHJk3lmZVv7DQUmBdJbJHBt2yDbvS24+ft+xE+pkI5X364
         5NN7U15/35aVc46+eRfxAxhiTePnOOMb06F/o46TtRa/+KAxnC7v+a1S2wXDlK8VfBWx
         cRmtJyCTqurP0jWSQ0WfCrOSEMHa+Qsc74TgFEq5JGhjvEhP7KaPdIxdJE85UyXhHBoh
         jHl6WzblExvfK6KeKTD4AXMjxzsX63JZIMLnvmHZvD+BkS3G6ijV/ou2X6cQVti+MnOR
         zUeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221461; x=1787826261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        b=JkvYKJ95KgONw6owUNOPlCJ1ysho2lfe5m6A4jWVsagl46uw+6WzJZUh60g6+VAX01
         pYlw9zXWFPy7Ff+CG8J6d4J5Aogh16GJ4F7lLFEanZcQ5tDQkiKOm41vNmFLohNekoeN
         TozYf8tvbaneWa0wyv9PWZ4oeRqtAJYoVDeG0buNdfLBFvoGNnJjXcSFiHtKHu9bUdcm
         k120Xset93TcdG34p2XM37EewzqkcQX1GZIMnPLNJTvUAB5A7QN1/JE/2kMCLsBTNj59
         AaoqoJI3Qsw2qr5r6h79X1RK97Fg605gAbWwXn+a78nGP6+UL4alM54mrutuNJTmw7fB
         287Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221461; x=1787826261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        b=lxAjoBQiXW+J9mvEgRzdBsovElJut4Q3Cl8JGlpRXMEQkKj37edEssz574JWWCMmQT
         MKK58lBo+H6zSnnG/rpiSmNTGu4clPVS/catzqQGvJmYqNpdCoJ0WUQjMQXgyKCwbODE
         GY+6f4Zv1e0RKqQ94sbnfQnszQWIeYn0ZZrCme3iZB+Szuo047dxiW+0+nhsgjCHdCIY
         KLRQmkL9zaT1xd/H7HeMIM64SSF+F7AtP5odOm7c6hSDVSpHMdySm3h+AQNhC4hNhphv
         6tiy3GYguYg4sOBKoy5Yizw3iawJh52P0CjQrvugEbISgLCdrzixXlTXEMsJa62DTmYv
         XEMg==
X-Forwarded-Encrypted: i=1; AHgh+RpFR5ePZnMw1fJIlUUM1lZbj2Su62sldZlTslWvN6+3AaHJ9ASRY49SWX0R20/J5P++KjhLdh5JFV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JmRSnO0/8MFEXRcbFOLf8NLiYp+up1NJH96c7UGVxQrh2wdw
	cvf2mcO7+Ph1ubWXaWB9P2HDi98QvbZN8nArih5ZczKE6o1Cb5icrjpLBVXaoxUB81NxnZWvTVy
	9VjNufr9Auag4vHdQmC/QyC8Fce4NAWRkvPumZzv1l7hLcGc9A/x6oQPYT6iQNZEcV8r7o1LqN3
	Tlv+xIOeeCqeKTgR1kHVY1u1gRgNikloFSQa0Erw==
X-Gm-Gg: AR+sD12yidAKHiowTUeyCtJdcCaJbmgXYCmFCcUSr/HldbZm+Snfsne+yhIxbusWjx4
	bHO7iOFNdqGr4/MdyVkqpQJagmNKTbJoz7FhrVurDmz55Rlu00ak4toNjE8WNu5AdWSX6ktUgcF
	Hd2A81g0BnrBEEFNuub7k62+h3H5Q3NAwUlKNk0lB2oR8qLmHQfMcVrqWoXQ==
X-Received: by 2002:a05:6a00:2301:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-851d382e720mr19263258b3a.8.1787221461182;
        Thu, 20 Aug 2026 03:24:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2301:b0:847:7ffd:ce35 with SMTP id
 d2e1a72fcca58-851d382e720mr19263163b3a.8.1787221460718; Thu, 20 Aug 2026
 03:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
 <CAPx+jO-ow2vo2wMxERLGse88wLoaR=HLdOWk6Qwv97ZdbE4R5Q@mail.gmail.com> <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
In-Reply-To: <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:24:09 +0200
X-Gm-Features: AcwNN1XagjqLsUfXCAJXyqu2taAnOsy7gMxOrYs8oiiblP73dGEaPVwCq6ztGis
Message-ID: <CAPx+jO-+hLsAdDC9Ep16cO52cA2c=xKeXvngkGqzoC0FyxXj+A@mail.gmail.com>
Subject: Re: [PATCH 10/11] regulator: db8500: Add power domain regulators
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
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: kab5fGEUzXMorX1V8p2Q5Rxd2BEkqB_-
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86d5d5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-_xB5rzH_TN0feDXJEkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NiBTYWx0ZWRfXypyJen47DiYD
 NU1k19HqdHY9P/UT2d5ol8q0+7RWqA/EAuom+ruHlPYTF07j5jEYdtYJ87L9CrV4qLngV4cP6J5
 8Pa0FHtH6rPOxuR8pta0QkrRcn9EOnJPranvBheerR4pasVR2WsK2WzrvZzaoTsD7sE0MffcW0g
 Dj8O7BxFAGMziumd1A6wq087rNUX9SRG4DDKAoysyfbarK8IY3lnF6lHuPJmox5bXrOBb52QMZ0
 VxuWDJQ5HVdhSSvMOIe7Mc8oxrOqve5sAChxx5xFT8voyFZyeVB2e/IoJxzzW8nafXWcpUvZzdp
 plecMFgymX+U963oY0X4jSr8q0Wx6WWLH8nERBLcXTozDL+6/e6tlb4fRyzIUt5bFfRMJGXs5+A
 rXc4LcMqIisy4acvt0hdy50dYzcKn1iiYcFtvE1FPu5z4JY2OP+o2UpCXQptSGAxoULsNIr7OR1
 P0KSrPExYzTpIeGHpbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NiBTYWx0ZWRfX1M2rB6B6AkQ2
 0El21cyU95ARMwrRes/D2RE0QQBUkHYX4wvxHAvAgoRdtxIfSjE/9Z0R6yIiYICE71A65+BRyez
 +dVo4BxBHKrGG6H8sC6WX/u5DKnlmiA=
X-Proofpoint-GUID: kab5fGEUzXMorX1V8p2Q5Rxd2BEkqB_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200076

On Wed, Aug 19, 2026 at 3:30=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Jul 8, 2026 at 5:53=E2=80=AFPM Ulf Hansson <ulf.hansson@oss.qualc=
omm.com> wrote:
>
> > On Thu, Jun 18, 2026 at 7:01=E2=80=AFAM Linus Walleij <linusw@kernel.or=
g> wrote:
> > >
> > > Add a DB8500 regulator driver for the VAPE and VSMPS2 compatibility n=
odes.
> > >
> > > Back the regulator enable state with the corresponding power domains.
> > >
> > > This is done for off-chip consumers: the corresponding voltage rails =
are
> > > routed out so they are used for powering different peripherals using
> > > these voltages as supplies.
> > >
> > > Assisted-by: Codex:gpt-5-5
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> (...)
> > > @@ -673,6 +673,7 @@ db8500-prcmu-regulators {
> > >                                 // DB8500_REGULATOR_VAPE
> > >                                 db8500_vape_reg: db8500_vape {
> > >                                         regulator-always-on;
> > > +                                       power-domains =3D <&pm_domain=
s DOMAIN_VAPE>;
> >
> > Hmm, isn't this the other way around? The power-domains node should
> > have a regulator supply?
>
> They probably have that, but that is not what this is about,
> it's the other way around.
>
> > We may even consider to skip to model the regulator altogether and
> > make the power domain operate directly on the prcmu instead.
>
> That is what the series tries to do, as a whole. Sorry if that was unclea=
r...
>
> What we do in this patch is to deal with the fact that two of the power
> domains, when enabled, also turn on two external power rails outside
> of the SoC.
>
> Since external components such as I2C devices cannot really be
> claimed as "being inside a power domain" they take a regulator.

So with I2C devices you are not referring to the I2C controllers, right?

Are you saying that these external I2C devices consume the same
regulator as the power-domain DOMAIN_VAPE uses?

I thought these types of external devices in general use a different
voltage range. Moreover, do note that DOMAIN_VAPE also has
corresponding OPPs (performance states) that change the voltage level
based on the requested OPP. I am not sure an external I2C would be
able to cope with that.

>
> This is based on my understanding that power domains is an
> SoC-internal concept only, so there is a clear boundary if something
> outside of the SoC starts to use such an externalized power rail.
>
> All this regulator does is to make sure the corresponding power domain
> is enabled when the regulator is enabled.
>
> I will repost all the patches once v7.3-rc1 is out.
>
> Yours,
> Linus Walleij

Great! I really appreciate that you move this forward!

Kind regards
Uffe
