Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795426329;
	b=dr58Yfkb6LmWpZvmPKZZlOkz+Y/PPOcXn6sUFOGDEhTuZ75vUoY21dbQjok6Tz2aB8vw
	 dpfkumw1OLUw7GTSJxIUGNAcRXvNN1aS9jKxB1aOCiBL9PxSMStUf85EiXYGRi9Kvexv3
	 5WFexxbivKWYm7iL3SOFtkAEr6IGq56qqyvX4M6shq6ZM0zMPwek7y/E0VaD2xzpisMzx
	 AKjiu5uzUWy78J3m7ymAruZtNf9jiGx+DHdOdYgigeSkEGIfzAk2WhEl8heA37Qz/cPSi
	 zBeMP+Tag3YP5eTpOon+0UoDow5/WfoGRq/neUq7r6BvGBzWVBhIRq5ehhVjarFZDEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
	b=xOez/SDlrs6UiFQvN+hDj5EO4V7CkzBxTkog5dTAPTzb+k492IeDMNDep9q220CzOdSc
	 vDOQ04VDOAdvKjd3cSwDMAqphqGz9D15cg1Ab7HDMJK8Cb2SadXV0H0vrEiA0Zs+/oFkp
	 1hihBN8KwXYSqo7/KPCfiy6wkcKKiVv2AfAd4BQX/iqTJXWxR6ECvOH7pglqWqOLQEvGz
	 6bYHh/Re2rksvYuzBZ9pqGuZB4b/DZ3WYZoKdNA3aFqbKfjNZJdSkq5qiCBQpTQZq6NL3
	 4OipLloOCo+jhHh3UmTGJobbi4GctnvyGPGeN6CpSnibYn2cAIATfLhgHVreQDSzKaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imfeXxH6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03742606A31A
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 09:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03742606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imfeXxH6
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50a4a2132cso422558766b.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 01:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426327; cv=none;
        d=google.com; s=arc-20260327;
        b=MP97twensoNreWHx9usQuo6HH5qnaBHw1z3kWx8vIMl4kyeasLB8jTU5XV7t5karZx
         ghQ2hMBfTpMk2S3c0iiRhjJ3oX43Sevb9xLWeT8ZQCcxnPRtnwYYlOKJ5f06XoV9ZRpi
         INrpKqOmopRNbEXXkymNrrfscYtKK3dR11IdEk0yJqwDp3eoh3VmA8iNIxnYRvfysfsG
         CBJ70v5AFh+lc67XynmiWcbxRq+AAnO7jwnyoyFMqBS10IbbJv/93fcE5U99xDbnJDuz
         s5qovOjDKwpuFmIigwbZD9O0+1IDQL1ist7Qpu/hUzkQVLDelGnxTA+DP2YKh2xDig93
         v5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        fh=+k/c8md04UBwZ9sPPNadR4dnwD9JAjRTgFC/u11DKBc=;
        b=ZEkjS2o8Dxx5I1aFGbImXgeRuxLoA0QwXt1ydzpklP2ynrFJRCD0ijXjHr9dftRqaO
         D5rjL0Zv02ZcZ59nlj0NPNSCaLeEzqu24jEbhskIdbipTB++bHAJIuj+zbUoSH3qIEBh
         8fwVxdqNSaRmrAbba9Y29m3RjNEO65dZEfmhdllDXCcjN5XH+/LSvEfAIbPnFttSHIG2
         Q1T0/S690zQQT5hhJs6o7i76aGkDDnVtq3zgOAOu0Pl+1ymaGQ+01d/xfmhTLswTTsiP
         ekRDmV1Zf0ThWV7FxPJXRo4TOF3dduTRqq9+4caJuasiVI0tCOQ1pp0ZQ0spxiJaXhp2
         DbZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426327; x=1796031127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        b=imfeXxH66PBpj/E84EZCxuqW7Po7Duqu10Xa69+uMMVtV6g2StkpPtgpz6WE9RdgPp
         qAf1rYfavtizXM5Gj1QZnGeYNZx5QesbKPyFU9VGDTZtj1AT/JRkYMEFKOHP89Wc4yar
         dKGdm4OOx4y9cRufchgiqXMcU4Wcgmh7VHDoETtFv8RN+E553L8l5JKr+si8jzZShpTf
         INhKo5slDcVEKG7NLRyMEHGQfZiiFvJUkVs9X41yUDS9sSabZPMyT0ugB8o3TdputLpT
         wCAk69LqnrJ2/LcQjmutaNkB+UOKImwVAi3G5j3gCApMDga5jZosgSb/c48Bp51fXm3Y
         BJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426327; x=1796031127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        b=YTsQA2avIxKOPenDFi7LKX/V5qIK4BcR3TSWnNDuqqvyzzviOgYfdcVVUyVeR+su3J
         ffCdhgVAIftREfVKy5WM9O5IF0urEP0tmhfIODKJ3xfn3V7QQmYx1/kd0gpFFPA9ziQl
         3DJOG49nvaWRURyG/as+O97wLItD2jr9vRkvqdKB42HbI1L9JLO2ZdAlIZPU/g0irXyp
         d9/b2uvNz7fGP/71Geu+iZazFp7i4ACjgufAAHMrHDlFdjdj/jE6HTKbjKqvPqUM1dKc
         TuR4TQh72ysNd+vJXBChbfzErT1jnxuc8K/5i9s4duSIl29MJk0iCLkPcCFhcitM+nMo
         Nq6Q==
X-Forwarded-Encrypted: i=1; AL+hErF8OZkwVTb1DqtIUMadTMZTqkheKSgtTiDkr0xto6MfgoUbHlcg1L/FcypzL1RSF9oX2a+tvMyeA2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CHM0JiJIfSRDLKxRtDC42PVIZpRj6WQArPZacuYkyNU8arlm9
	6mTmx6AFLhhUmc2Kt/1bhFAzE2yjwLxzWvZQUF3jdhGdY29+dif/vV5VPlrZT2XnKJ+byATpexk
	6hyxtmMJGB+AN1R6QrHv3ol1X6zXgaKg=
X-Gm-Gg: AZFdTZeDDD/9njhvi7uVjs4MoPCjbKL+DaRrvAxVipaesa8DIGCdkzph1gk/+uq8p+g
	PckHbwlNlyTK5g3htOdMqWP5kLEj3b0ExXFlL07nYNkNaEK0EqRFo8IutIlDIC9mm/fRdLxGpcT
	xYQn3/gbUV94IkpCPkYMOiCZSGVOzSHw7Fn6qyMlSkVOVE3bV1Yzh5phN0xqx5um3KfmCE+r6hg
	4y7B+QgKHTiyHublhmZ3XAfXLDTWKFJcTph+Kl3D7nXoluMCuMJphXLtzqhhhaDET/wuq5omzo8
	Yau0+Unya+MWCmuPX0/8fgtgEy0pKUNtMO+bar67brQi4GLeZD4YLRG22Ff7V/qDbmaT8Qz2e7N
	bs7UPGsIj2v8lQbS49ju1kY8PiJKjE32Ka3+/
X-Received: by 2002:a17:906:3b04:b0:c29:3c97:c994 with SMTP id
 a640c23a62f3a-c513ab47f35mr695113266b.35.1795426327146; Mon, 23 Nov 2026
 01:32:07 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792986696.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1792986696.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 23 Nov 2026 17:31:54 +0800
X-Gm-Features: Aa3M54rO-ksGTZJl4gmuLyF4LQ_Lpi7KMAzUqlHvweFGPCWngAkxXQw_vYlvNLk
Message-ID: <CAMpQs4KyZbsQO3-kvKrzAVJWEFghpGG7kSmpJvniYeKYaGfanA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add Loongson-2K0300 APB DMA mux support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

On Mon, Oct 26, 2026 at 12:33=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> Loongson-2K0300 integrates a CMC DMA controller with 8 physical
> channels. Peripheral DMA requests are not hard-wired to these channels;
> they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.
>
> This series adds support for that DMA request router.
>
> Patch 1 adds the DT binding constants for the peripheral request IDs
> and yaml file for the DMA mux.
> Patch 2 adds the driver, Kconfig symbol and Makefile entry.
>
> The driver registers with of_dma_router_register(). In the route
> allocation callback it validates the <request> <channel> <flags>
> specifier, programs the SoC-specific route register, and forwards
> <channel> <flags> to the parent CMC DMA controller.
>
> Thanks.
> Binbin.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> V3:
> Patch(1/2):
>  - Merged the two commits containing the dt-binding header file and
>    the YAML file; no other changes were made;
>  - Add Acked-by tag from Conor.
>
> Patch(2/2):
>  - Append the dmamux object to the existing CMC DMA line;
>  - Add loongson2_dmamux_assign_bits() helper, no functional change;
>  - Add Reviewed-by tag from Frank.

Gentle ping.
Any comments about this patchset ?
>
> Link to V2:
> https://lore.kernel.org/all/cover.1791535540.git.zhoubinbin@loongson.cn/
>
> V2:
> Patch(1/3):
>  - Drop LS2K0300_DMA_REQ_MAX as it is not part of the ABI;
> Patch(2/3):
>  - A more detailed description of `dma-cells`;
>  - Add the `dma_requests` constraint
> Patch(3/3):
>  - Drop loongson2_dmamux_map->shift;
>  - Move of_parse_phandle() into loongson2_dmamux_route_allocate() avoid
>    UAF;
>  - Drop loongson2_dmamux->dma_np;
>  - Check dma_requests;
>  - Add devm_add_action_or_reset() instead of .remove();
>  - Replace `metux()` with `spinlock()`, which has lower overhead;
>  - Add loongson2_dmamux_route_free().
>
> Link to V1:
> https://lore.kernel.org/all/cover.1790068409.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (2):
>   dt-bindings: dma: Document DMA mux support for Loongson-2K0300
>   dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
>
>  .../dma/loongson,ls2k0300-dmamux.yaml         |  72 ++++
>  MAINTAINERS                                   |   3 +
>  drivers/dma/loongson/Makefile                 |   2 +-
>  drivers/dma/loongson/loongson2-apb-dmamux.c   | 404 ++++++++++++++++++
>  .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  53 +++
>  5 files changed, 533 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k03=
00-dmamux.yaml
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>
> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
> --
> 2.52.0
>
>

--=20
Thanks.
Binbin
