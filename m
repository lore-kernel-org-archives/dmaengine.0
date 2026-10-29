Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276029;
	b=3bWa5i+Q2jz3bxd2M4Apqz3kE29jEIgafip0Gvvfz790lxqVXHGW1PCVMbWRWVHNCRt6
	 mVJtnGQSksUY2HjiZ4IUt96j+4hb+sbX2D4nwhaHFijy79WCOWiRkzTkXaT2M9mPoFA8W
	 P+0uZ5itbRrwbkiTEa3aPrd2qcnIt1QqGxTEUYPVAQtAqdA5bo2Kjlda/rwOdBNEu1q7j
	 /E6/01pboW1VUIF3Qy5txPckWEwGfiyF+sTbdpWkXQJTvImvvJHUepeu3UKfzmpm8WaHC
	 2Q2Hb/hwfH32G1YBMONyAnvoivs+GUn1IVTBXhDk2aniISwTAn9fQdxuk2kzE/+3yAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
	b=Xlfb3F3qGTzAqSfmI9qObFX9sLknZqsQHQVqiY9OjrXMpb8Pq9YkK46Xc3EJw9aEiWUN
	 tgXi2sX4KhwFXnKlcP95TWnBKugiolBrIzjcmfTa7eFDyuBZEWnzod/pC6MN7kQAXTuNM
	 C8+HdejhHW99oheaEa43qN9W51PfpAlkrgVZxUYIaifkjdkliWUU8mOdOLxNBDxMVCGfe
	 u/xNBds6aMMnKAlvoFYJJr8HZGoworBJOU3O8A3KSiAOw9b/PAULMAbhDE3928NGg9fvB
	 Vlzl/Fb5tljiCDQcecch/HPKb1EPOqcs265RCZWW5NWv+kLCRFPaBWduiVwebODC2Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C67606A31F
	for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C67606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1283581e87.0
        for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276027; cv=none;
        d=google.com; s=arc-20260327;
        b=EMg/T0qkF5uAUjtOADtEO10fPSWxcmKoclowtiID+dm3XufxA7R5WrLtJqiTCvmNmC
         Yi/DSmiQvOgVcy9P0azVgSkgnheYm4S8m4aA8byKm+U2+BC5q61j/J7rebYjLMn6++Jj
         O2psAmuuud++0SShq9O7xqQRQYxpfWWYHoNzvjiuRIxNgWVUUlEttno4HAxjo4jeSMzk
         YbEHvlWH58rHnXEWBGf12qkYQ3LzRAqJf6kFqgWXRgTdF35bJvKot2MbR3qrDC9wW79v
         j6RcxYNVPQfJFiQGIG9g43gSl5nB50GdwE7SYydo7UPhtN35V3Xc9FQSeGRPAz2Q7xVY
         NzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        fh=7GsveLshJnCvRCvk1WyEOprw82llOnN+ney8Zsgg4GE=;
        b=frsgTKtvq+dVad/53GsdxdVNP9KGLCUUXlw6WoVObHJfpXuE5XTFHL8hXMbFVdunMg
         gcbvoucEcIurwCEwK66pyZLA4Ir5HJWxUZ/bnXx/r+fRsImzrfGeiPpPJAfl30kfkan2
         EN8beXM/EDEhDs1VWZ3Vd4i/cQw5aTcx8j5RRQA6yJCNcl+bpjs1//DgEa2EpR82cDbV
         ihRVpp2GyX657Oqt6M64l/lYpksvRaAFAahJM610xS1PLRZvodXDciAwxdVVMkotEtkc
         dpq5WVB0Akkw0MeIY1g80caGScuirarRjIy9rzzuDvKFa5H1oNVTbfKMyKH0xIZVQAqc
         RTGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793276027; x=1793880827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=SdjNoLtW9qanoocdo8XfaenLx7jG1vntJFcC8DkLO+gh6BZGq+GtSu/nUUaUUAYTV6
         2zn+32xB2BovX6Y27RtIK/EOCo683DTCuzzCkh1N3PXsFycx0m5ifziqVf6DIcldaxjb
         xFeM6ZZLoJ4TY2/2Z18WlvenLwcZiahgNKalU76tqMfRGU/srBmlyawiUjXoi2bjolO7
         4GarBiynJMxY7rC17kv2QulQqG8X9H8zkpNGO8MErSx+sneTtM9vL705EE0XGqM6Lp1n
         sxShBlDR4AcyaoIZLOQXPB6Pc2aChpyKoUsoA1iN6gOHBP6Xmg9sukVA3i5IM8zab+dl
         uQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276027; x=1793880827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=wtMd7cKEINs5Z0xa2tN9MlGWZHLJVr40NjrU2CF/JAbIAVaIMz8K8uCB44CjxIo+CA
         xToew2fiZmuEBU0mkRMOfAy44MFlhn7kgzDTsA7fLpGO9IaCyLeq/zkqVc5XxvzNpooE
         B7wFSePYTsn1UgIL/uxhQVDxqsjUsC92Bc1h9KRhbRe8rNFG+BInbZVXjvZxH+xjNcxL
         qOUfkZdl6r+QaMHSZ3j09H41FDET3IdwlsZyINgVYpxpZy72HzphJEtSxB9vXOYNAocE
         i5UNSK09BxAiAOTqOcKAzHwiURWJZvWMbMg70rtdXS0QkjojAsmpkfELN2/RLQYhkbRB
         lWDA==
X-Forwarded-Encrypted: i=1; AKwUvBwTH788OqdPJvryM1IPIt8vbeKIu6d+yMzemrBWZeJ3lDqmJDX1qnfxiY2J9VOZEWSQMieIQD+spFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL77hhcMq1CgjRVhhROn0SEh6OAsXhegWkjL/NjKFZ6kML4ac4q
	MrPt9MlcT3xymLXDVd5PCXdShEKvfn7+7QOsqT1KFhEDV2CoKoE26U8BxlH0QXQ1SNz2N4FKy64
	LNXSKUeux0/XWb9x5QhoufMeX/BsssTs=
X-Gm-Gg: AYBFou3ZF58NYiFgGQdXrARGspJY6n0L1CAcPul49SNPXFP/jnCliNMMNfoCh8yvn0Z
	ByFyuW2dAOD9RQACRoUKWLPwHOxQk8kNYKxOqElNUfuDDgsd1C6DZMCZNQ/t9vMkTgixmahZCdK
	7g97UDK/0ZjidfTYW2eQLUe2h00Qj1PhVJb00Zhmd6jwojdWlnKRrIoQA2wvbmuB6Yr96GZgmAr
	RrwtH3ih87SphDQmaxWz1Mkfjbv7ckR8CREwJ0Qa44HBkgyPc5P7WMQ+3rk6xFvc74J0m83K4Bp
	p5Sq5De/t518Zwv8kqIva4A9vVDxrD7/a8jII0BDJ+sJHImFyGO5op+SXlCey75vbUTDmHCaUvk
	75FB0DR9+0do24wkKuxZAzDKZt5CVO1dUb4jzsLFMNVdj+52mffZiXXuqlu0MVVBiMWXBm8v3un
	cu8QSFv4WoMKrlhigRfCtEoDk=
X-Received: by 2002:a05:6512:3d86:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfcaddbde4mr1985707e87.31.1793276026925; Thu, 29 Oct 2026
 05:13:46 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 29 Oct 2026 20:13:08 +0800
X-Gm-Features: AclHuK_9NKjNXktxauulycDv6ofwBJPad2Bl9GVrdKZysKXzXdts0yEdkZdQ85I
Message-ID: <CAJhJPsVQjajTzOwXyqUkdTT+Cw8wEX7-0NOS63S9cByvDSYLng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:43=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ...
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # loongson1, virt-dma

--=20
Best regards,

Keguang Zhang
