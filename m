Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B348A8C1
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540245; cv=pass; b=CRQOUpAG7nmS4rQH/GOL+RGdnZpugxvstQJTurri/+WRxWKb9ajoTn8kMIIaYG8dCAlvRc4nhxBKFGEifrA9F+EiOQQ2hORmfrMj5z0Nm2CHypogoJAfFFSOOQKnfGLGU1Znv1PgT618rq6GiNwcpOTTSv2a0AQRlabjPuSZzB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540245; c=relaxed/simple;
	bh=PiIEJBacYP8RPpVhrEdxj6N1ZBrQAEJntz0xmldB7uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COJe818scryf8G7GFrqSyQp0wIQqdDmG0cqU90ndQpPXWebxneYLZg5FAA9WpsjQyuFKtaKfasKPascdLg3/3eVANN5HZ1Tn74/1g5/096OtKHGMJ21Jl2/2VxR3acd4Ljz+zKeRFY7nTuSUZV2hdLJuYqtkKz4aA9JX+UHePpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEXjmYKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cn+iYpeF; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEXjmYKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cn+iYpeF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KMk41625990
	for <dmaengine@vger.kernel.org>; Fri, 9 Oct 2026 10:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=; b=WEXjmYKVBun7yiWt
	YcX80+2wv35fcTXvK0ES0ZsZU2i6UqtGQUdqQ4VwyEeUF/DSdreHDgunke9Bt6Zb
	uScCI2vzXkW/VEx2NnFgsweM1StFeweU8GOg82xUFPbMEEMB5NkDKsgUgKSkizv4
	zY5MHEbeGsyttEzp9ebcb3RpBQXkvjgKnoSv8ArUfBs/s5/Y6GOMqcgILZDcv/pS
	pEcgCWyXzVgPO46tMgTDwL6Q3MsUFTZ0c2FA0U+PYKGZBGvML8OXH3wDKGQHqrkL
	9HJuqxwi9YNtGh4mdyRvz/KF+F+jklfT+CQgBQ8hU22qEI+ihK0+Ax9tR3OQTFbk
	B8hibg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj3080-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 10:04:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88b59692e0dso5403033b3a.3
        for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 03:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540240; cv=none;
        d=google.com; s=arc-20260327;
        b=Tx73a2uVLHqALnwtWMa/wj9lo+7h2xFmtm8DH2S0bGL36TFkcBgfOMUoRaJ8b8gjO6
         eY4OJaBQ6vMCooZJarQaZwB/H5MtGSz6IWHfwOSp68y5NuFYXWZNtTGmW0yhJMz8oa1C
         aWSAmwNeNkgyQ4Ajsrsq8096O0RPmIk4Y+Gm72UcClJpqdNG+6S1wcvbWJfclUMHkVxv
         e51DEuuDQ7+m+gsvkAI2rCI/3dBSGKInDqEeE8//8ymr4kIiLyWuQTej6t8RdFZRk8ex
         ZDorIWijDGzYjIZ17/F33i9XulRk8d4djkyjc+iqXLZEqP7zXoOhuuzFMAStBQekSB9t
         DWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        fh=QB3ddYsMisl/nz4OxjiwobBQJgeeY7/GcFZsSbD2GYk=;
        b=OCHbljekJihw9G+vqgPkpztumDhsWg0lobfU56nq8cJFxrz21AzY+Mg1H+b9U8d7//
         SLhos6QlD2i+xe/KKImtbs7bVBKznz5X3r0+Cj4XtbtxIXQ6OzbLgfGKbYhYI+8c4SIL
         2pCGWJurfIFt/I926ZmeELMt6ETUicJQzuhFi+YX6crKlgCE9Z2jp/dEQnx5cf42tDGT
         OGD+F1QNFNyhsSrVRQHVrnXFVBQcxu2/2iyjAzXPWONL0vgfcvmZppoH0GQN3x67XT3i
         wVdnAu3pnVfyPyFEUkHoRIfS4jtsPUxlL/o2g/HtmpqnT26fX/65652s+8hU4M2+NNlc
         ovBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540240; x=1792145040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        b=Cn+iYpeF1wxWB/Q0vk9Za/mHwuHK06nHpCGozYkDbM+vXFQ2g4q0UNeXahm2KN4uhd
         xn8E8Uiv36mBANv4zZCfb5JDWjLgoZW8tmpoVeGCybcd814vGxq2fkgC197ze+aYUdwt
         DE0dlz0yo75hLo2f1L4qo0/pps+aZjyrWNzbJYzdL+laGVvpYpqe2ktVDXyK4FgvUpdq
         0QbCge1F2m17mHp0zcAJl1vjmwFSZw5fPtTwQ26hUBqCcPdrnfP3mOmhz8RpEZW1PanJ
         807dOGN9P65bL4qSNy8RXKJrembzW2Hs2XYShaSfTmdG6O4/UKAqlh0zGGUUd0GMcBsJ
         KBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540240; x=1792145040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        b=yKCbc+IUPabAGD3MplP8yMKfX2Zsy26BEbz93UOgeIxPZ9dgDDxWBgPBgcKP4Pv0Ii
         Yr3Nd1egJec4e7LPEHJuh4dJpHzUQWpxSs/gn+0rviHYLk/0HLrKXJ5Dta5phPpCYaPO
         lw+V1YcZXNXQrY2nCrwFcu5/+rIJOT/JrRMSCOXRixxjCrEBLDKxPZWFcrWSkK5+rtCg
         OdDiBhmtDrfPuUXNNzfTO6BVBIPnnUMRDMRnjZRokud1LuJ+WD9vKkyGWHmstUpp0A7o
         AZvt/HAAAsEhpRq3rkkELSTjMjhV0drQQepX0ZIft44txxzT34R7B0IQbhhfKe2myUaH
         2ksQ==
X-Forwarded-Encrypted: i=1; AKwUvBySagwX3xcJu809Rz299qz5SxSzkQ+oV7ZPPLhHAYhNJmzmvwAinFX0oZjNBZPbvKzFSkFGNJSXMEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbprMdb2hkx/u1zg94nvCzn8zEJGRLs8Pl7kTOWnSEBWFPrgyF
	IYcKm+HUpt/X866PuqBVJ0vIpfeaOQdmrK5tydx6af2hihf4BVjZXqc8O/Afai0ii0Vk66Rry6n
	og8V0Gs2WwEe2jS5c9vBOyHVaRFLcdxaDrNy0hEnUkox49SkkmZP3w9OIU2D3ka0D9+WGXRaNmi
	8LuRgN/e8Y5Bp3W4OY4/FRGJJgIX8cGrXjKnobXw==
X-Gm-Gg: AYBFou03YDKY3URDQYMteEmqL4htX121ZfogDy0dhXSZ9XWy0BC54fQNIK8yq7kodQU
	vrBMq2h411OxmFHd7LTr6bE/fP4c2nA9oH1PyEgyHp3P5gnjBDhbpQe8CEx3pTKawTC6JJny6x+
	L3qIp/qnA7cWjoZ/pOye5tKjcIrpYxx8qRgSQRpxkr1kRWLpDWDkwhZePzdg==
X-Received: by 2002:a05:6a00:4f87:b0:881:1fb6:a81 with SMTP id d2e1a72fcca58-897c3ff538amr1154977b3a.3.1791540239788;
        Fri, 09 Oct 2026 03:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f87:b0:881:1fb6:a81 with SMTP id
 d2e1a72fcca58-897c3ff538amr1154954b3a.3.1791540239339; Fri, 09 Oct 2026
 03:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
In-Reply-To: <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:03:46 +0200
X-Gm-Features: AclHuK9hQAW8ziR1wvAdOw0nLveraf3a0x0LG_1OOR8LPyJDyZu5bXvxmgGRPSA
Message-ID: <CAPx+jO-wb6NLYjnn_k7xu=Wqq61+vop9o7UM=5Y47U-WiGFXBg@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] pmdomain: st: ux500: Implement ux500 power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.li@oss.nxp.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8bc10 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=MPZ65LRjT8IzFkvHGtsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: OAZN1V3TKgE3S0lRQlEkUN8whtJcfJ0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfX9pMQ5liPcNUw
 bSxGD1yZ+ZB7WPy0HnFDBpTrvgqswaWbmSAU+lcRe2Ro6eDksbkE481QyTIwqEj/3oli2un4kbh
 xOR26wc0z5xDGv+gNkmtgNSbwJaX52UTOdoV/fT2D3hoc4R3u2/PvjShdU7zV9WxuiHHsbNd9WU
 eR+TeYnYK9kOweQwMon/rnZw3ddrJLxXCqY4G50fS8NU/kuwgjKB08LimCecmdYr/3hTpbi9F9W
 lokw1t/d2ldNZquyGymNEjMOv7W3ru3Vt+FiW9vYlOjgYPu2RZ9GudZrAZ33bqiz4zapLOTIcNu
 ioYADLwKl7ZJTy5Iq8MhUyx6kzXZyrt5n3xzoJt3W3WtswRGgSetwAvUX6zpFwUzgSiggs+6l8W
 +03AZi8pOpJaoHsJOqRURO1pwjrqwp5eW6ggywwwy4LAHARhQRcbu71tEmvegnP/eKeeH8M1Hnt
 Qx4ODPbCAxyUWzR5IZg==
X-Proofpoint-GUID: OAZN1V3TKgE3S0lRQlEkUN8whtJcfJ0K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfXy/CmRMuhl5mV
 uWobWZYyqbyImnbnuu5cC7AUivPcAiZLmvfhOulojJ/aZ4Z1PHqQxirUdb4a5MHukAmlTpwKPjB
 apZIsqdFnly9uNySCe61a1wchULKrX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090039

On Tue, Oct 6, 2026 at 12:30=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Ulf,
>
> On Mon, Sep 21, 2026 at 12:48=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
>
> > This series pays off technical debt from the beginning of the device
> > tree for ARM initiative in the early 2010s.
>
> I have so many fixes series that need to land for v7.4 that this is
> mostly targeted at v7.4 at this point.
>
> However:
>
> > Linus Walleij (18):
> >       dt-bindings: power: Convert Ux500 PM domains to schema
> >       dt-bindings: arm: ux500: Drop NR_DOMAINS
> >       dt-bindings: arm: Add the actual power domains on U8500
>
> What do you think about applying these three patches to the
> PM domain tree as a starter for v7.4 if it's not too late?

Assuming we get an rc7 on Monday, it's still okay for me.

Although, please re-submit these three separately in a v4 to address
the comment on patch1 from Krzysztof, then I can apply them.

>
> They are reviewed by binding maintainers and should be
> uncontroversial and will make it possible to avoid trouble when
> merging more stuff later.

See above, I think you missed the comment from Krzysztof.

>
> Yours,
> Linus Walleij

Kind regards
Uffe
