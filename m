Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737230;
	b=xTRaV7/2lRzfhxlx/16TOkF0aH8z3Zw98HEsiJezf3noy/eI0iWJBbxwY1gtF+gy4YHB
	 MFO9FOSNHyXZubDLUnPj0yj0miZHPL4X5J5g/kh5cefFzaleAcHkuE2k+ZgcrVr0bZH08
	 y04HfFMF/ONFnUJrvMSWAO+RzB6vYkdii1ydTlU+NP+VMlU94gL3gvN7ES+n3wuupCE0y
	 p43+3Ystls0beAsPs1ItQzZsD0Vl2uu1yhIysPEjg9i3NoH4kfUpyVmKfv2PN0rj8C4ju
	 sy0TMlOpa413nriEL+iyKSdZd0kagJs5tIywF4spgI4v6DhsHrUvGAjrmqjo2RHrdAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737230;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dCeztQ5HxwDrALbFNUBOun9ui9uCjFJ8+NCiMnBHpH4=;
	b=rQVL9FVZ7jnSudfCawa6sk0zCo6R32IKf/DepL/iFKUEdI5e0HOUh3NqKZHTxCKTg03m
	 KtMZSis+Z4Z1gvSgE90TJFAg5iZO/Q5QRRbwd0714XNELJZBWgOWv3hkYlHx/qL3PVIRv
	 iHSM3UY/FoTk0mAWeyEcRIi8w3qfgowkaYbewyYKVGAHeIV+u272RpL+SWoFF0wZvJPXI
	 NO7kV7Q65keJWzaQf5sdtUQjgxJGhjsfsBGTfIyFc8dRrRnVSPYTj+V7ST2w/IHCcv18E
	 5QRfNcJIs+AKs8hhHSSgCAMH7FlAZTKWP8q+yu03vbhfJom5BvZrzb2ljeEBxlfGW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F816606A31D
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 10:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEAF1F000CB
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737230;
	bh=dCeztQ5HxwDrALbFNUBOun9ui9uCjFJ8+NCiMnBHpH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ffULzAqtUK7kI4kzvHl1JdD6bHzKJ7H17fEJCLFK4rJN2W25ELqwOuy+22FRsAnoP
	 EwzXFKs+GQlpSCw9KRwbQyqfuoffTGjkLKnXpoSAc77jX1QZp2ZjSqfcwFdA0QHpQG
	 xkCbuSGmElOVvo67dSqfBVeRIfZVyJ+YYxbHjASYJyV+hL83tTTm71/mmEIM0S1C3W
	 JxtRObjt4H24/Pq0bR5r/7wuLxxPmQ/CqkG0o8ggPCFYvHGsYz151Bxo2moxz7rqw3
	 +FRYVmSRGs8jQDXMPZqoP6AAMIA98VxTfRvLr/XcS1JK3I62ueosjqdXsdYCOOgmt+
	 yw8uIR/3a01uQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso3831889a12.2
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 02:07:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHV64xwjIT8Mn34yL9Qqr7PjvRlO5nmKuygaH9oR8xAksXEB4Y2Z4i6jRdP1nM2iCr1N4g6Tjem4/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/hBlczkHTZF5OqCgml29d7RaXjzkodZ+t1o9x+lhGNB/KBNll
	7rXV6d9KIYhi/Qn/i2LS6f+gqbTjjojM+4CeoY25mYS63mMRC4ppSiLoQ+YJxrIN25PMSYnvEoc
	kvZZ5/D+NEwuzhMRzCLaBcVbj4e+1cpA=
X-Received: by 2002:a05:6402:42c6:b0:6b5:76be:be54 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fac2mr6104789a12.35.1794737228536; Sun, 15 Nov 2026
 02:07:08 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1792988985.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 15 Nov 2026 18:06:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5o5UYAoq1cBoBXxP3-jReEHKgjFbFswW+6q_FMBqHA6w@mail.gmail.com>
X-Gm-Features: AclHuK8xpqb4LMAXdAN5nwsCuwWH11cUlBYujIxrgNPO5PisqkyzXwB5SmcGFG8
Message-ID: <CAAhV-H5o5UYAoq1cBoBXxP3-jReEHKgjFbFswW+6q_FMBqHA6w@mail.gmail.com>
Subject: Re: [PATCH 0/4] loongson2-apb-cmc-dma: Fixes issues and pause/resume support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


On Mon, Oct 26, 2026 at 12:31=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> This series fixes three bugs in the Loongson 2 APB CMC DMA driver and
> adds pause/resume support on top.
>
> Thanks.
> Binbin
>
> Binbin Zhou (4):
>   dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap
>     NULL dereference
>   dmaengine: loongson: loongson2-apb-cmc-dma: Fix residue for queued
>     descriptors
>   dmaengine: loongson: loongson2-apb-cmc-dma: Program CNDTR when
>     advancing sg
>   dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support
>
>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 134 +++++++++++++++++--
>  1 file changed, 124 insertions(+), 10 deletions(-)
>
>
> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
> --
> 2.52.0
>
>
