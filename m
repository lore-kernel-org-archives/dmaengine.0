Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C53B8128
	for <dmaengine@vger.kernel.org>; Tue,  6 Oct 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281922; cv=none; b=BQyJ3xos3+GhBuSnPbX8DnjymAlliXFgtQqdqi3V/mmhNK6v74SYH4nnrsCq1TbDqMDle9IrFKvZJSHbl0TFKUtooI1QMUsKxq9JP2/DWCvxkhhzt3s0PAgJXkJxeebKiM7uWavDVRnCievAfc597rUj5g9IcbDxXIw2W+I1tsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281922; c=relaxed/simple;
	bh=dt/jwilYzzhagM/L/vZTbPyMLDLnWc+zPSXIzdqlY1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mw4aDhxRnbagAPMjdoyneiGMNONMxnQUVEDAKDQp98r7GN2KG+Fz80m3ag81acnNn7W3FLsXFzChy0JAiysa9GCZEgeiXP1SR0sWpxCBot94K2eCIo3DL3Z+2MzuybFTKrX9NZ3oUFx6YbRliCidj/ED+vWIPm+IZFSK11Y5vQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PN683oY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PN683oY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D3E1F00898
	for <dmaengine@vger.kernel.org>; Tue,  6 Oct 2026 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281921;
	bh=dt/jwilYzzhagM/L/vZTbPyMLDLnWc+zPSXIzdqlY1o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PN683oY15zp8haGUDZmeNa8Lzgwoa9PZI1Aa0dr8fojethXyk2JiX5QMTzN8ElJbv
	 7p3t1PmnYENsq4tmXgJh9UAwxtPuGG8sT1tFbe7cBgpRLMUM4BjHJEbMrlBGLRbfN5
	 xxJs1qF1EsTdhSRfpb6TVyZf3G+VK6HibBT/FrzykYiC0cg0/1pJIKAFpeCdTj2WUN
	 A4tacK05SwX/cmqVM7RhOb3stGPKWi4rsOxeJq2VloTrMgogkGzKVFFVVJicUjJpaD
	 rGY4dPEsVElmn38YTlUg6yKIj9U20/Md3XIx7nUGF4ah8AD0XNSEUrYuJ7W1Z0Q/jN
	 vHo7peZrGdxig==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba41e38a79so332424e87.3
        for <dmaengine@vger.kernel.org>; Tue, 06 Oct 2026 03:18:41 -0700 (PDT)
X-Gm-Message-State: AFq9FYIDmU4y+li+DhlxsNxKNlpStgQG0Z5DNbE7FZ7H/kg639SOgicq
	SXdDPlss/Nxn0NAvihMvBXYuwgt6OeAKfFz9uWOSs8FH8aZaqj47rMkqKBgb64n0B5BPjLD9iX3
	GjuDsM2SsAGRWQ1dlQ+37vKyKY9i535w=
X-Received: by 2002:a05:6512:401c:b0:5b8:e925:cc15 with SMTP id
 2adb3069b0e04-5bccc71fbd4mr477822e87.62.1791281920250; Tue, 06 Oct 2026
 03:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-dma40-dt-disabled-channels-v1-1-0f691109d8d3@kernel.org>
In-Reply-To: <20260918-dma40-dt-disabled-channels-v1-1-0f691109d8d3@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:18:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLmxLjJ+_QRaktGEhGk_hhqm-HFpb0RHgPkYyg7Nvo+okA@mail.gmail.com>
X-Gm-Features: AclHuK9v26DFRvHtY6cUKjZYZKLx_GE8BRektbVjVNaf9bIcQgFJs5TFssk_ZW0
Message-ID: <CAD++jLmxLjJ+_QRaktGEhGk_hhqm-HFpb0RHgPkYyg7Nvo+okA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: dma40: Restore disabled-channels
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Fri, Sep 18, 2026 at 5:46=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> The conversion of the DMA40 binding to YAML omitted the optional
> disabled-channels property from the original text binding. The driver sti=
ll
> parses this property, but additionalProperties: false rejects any device
> tree using it.
>
> Restore disabled-channels and constrain it to the physical channel range.
> Also constrain memcpy-channels to the limits enforced by the driver and
> reject duplicate channel entries in both properties.
>
> Fixes: 23fbc87c8ae6 ("dt-bindings: dma: Rewrite ST-Ericsson DMA40 to YAML=
")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

This seems ready to be applied now with Rob's ACK.

Yours,
Linus Walleij
