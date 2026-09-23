Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE3363083
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 04:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137092; cv=none; b=Bo6CPzDB13OkeFpecqjCpuUDTB5olOOj84xt2hc9xWTwqWev2kmdfNCeRqxh1xAIZ3IaINO/OdSEW/JlmGpd9LPpA6q4r1/RSTm+lQUat3R0XFPYYxpbGdY7WJCVEJA6Aqtl3spwrrTu6CaSCsf7jIVkJGcd78qTXiXszMUD7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137092; c=relaxed/simple;
	bh=RTGFdEmPoDrb6OI556int+7dbdrBrnQXddyxzFZNFfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9rP8F3NpuYCwbPk9JWO99Tm2pMVg0JzQhT/j7qQ+q0RkIT3hmSk8nexjZja/JrAZFRzTPSSXaXCNewbQuDISBnwCU5JKt/XW6nTLwiFZOb3RuD1t4RFO7bWjh+Pj8+ChTNOu3syRoFQ+P+H9PdYDF2exJZRyzv/K882UND3hEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ij7McffR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ij7McffR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D321F0089B
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 04:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790137090;
	bh=zjSyPXOJ+cY2fCf2UNQFDrawHRdQpjFrlg571DhmUu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ij7McffRI5WTNw+2ll14MmyCTuEqi1+IDWZyTmJIc4ZTYV/Ht7V/6Nvzd0CBHU1Qw
	 pDR1l/mJcJkfP6lwKjPSisaidSxuxVMHIk9wbmYmpHIBiSKvPNYsr6fGS+sESt31Yt
	 +2G+hFEebd+iUvW37RCD97Go6lPa1eHaYGuNBwTkO8jeNiw2JRNSABVjbEs9NQsW5s
	 2pMkSaOZzo9Mlkpz4A+/L5IAarg12qu9yzEL3Wp5pVpIOcYD7ObbWCtYDnKx6YiWaw
	 pne3aaSTFTLpJsclB8nrDcidNeEZPC/GyFuFPEoCTAGaqxFsjtbZTulWCbhQMPeMV9
	 FS3QTSJJESqNA==
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so708895a12.1
        for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 21:18:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy27bRGu8LfmXJFJH2G54+SfoOA04RVJPfb85H4HarPXWfEVznpU8lgyJNuVsc+sRriLeX8RUPPBGI=@vger.kernel.org
X-Gm-Message-State: AFuF++kFyTUq9BGDjEGwTeKRIspcxwuFRr/hB4mOAepYbEQMda5LVezF
	Dy9qylvOovz/J0x9ceHiEFFhPFrVjqYddMuuswFujfWRAevwikDMI6dAigRumXtcWMutwhp68jI
	HcV/RRzH2HrbOEA20R8CEI7A1PmZT6dM=
X-Received: by 2002:a05:6402:4492:b0:6a9:b549:eed6 with SMTP id
 4fb4d7f45d1cf-6aab3b6752cmr1228935a12.32.1790137088625; Tue, 22 Sep 2026
 21:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790068409.git.zhoubinbin@loongson.cn> <a7d2dae38291f9d23e5a930a394bc85d6c1db438.1790068409.git.zhoubinbin@loongson.cn>
In-Reply-To: <a7d2dae38291f9d23e5a930a394bc85d6c1db438.1790068409.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 23 Sep 2026 12:17:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6GcHEAynXr03LhtDxg3-N4Q9xYtR42tesa_n3JGH3hqg@mail.gmail.com>
X-Gm-Features: AcwNN1W8Sh_RUhG1WHcodJPzYM2DsOL4ed_XZ3frgVyS2sNS4ZNXGMzMNp7ztHY
Message-ID: <CAAhV-H6GcHEAynXr03LhtDxg3-N4Q9xYtR42tesa_n3JGH3hqg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Tue, Sep 22, 2026 at 5:26=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> implemented as a set of routing fields in the chip global configuration
> registers CHIP_CTRL13/14/15, which select which physical channel of the
> on-chip CMC DMA controller handles each peripheral DMA request.
>
> Add a driver that exposes these routing fields as an OF DMA router. The
> router's allocation callback validates the <request> <channel> <flags>
> specifier, programs the corresponding CHIP_CTRL register field, and then
> rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> controller's xlate is used.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/dma/loongson/Kconfig                |  13 +
>  drivers/dma/loongson/Makefile               |   1 +
>  drivers/dma/loongson/loongson2-apb-dmamux.c | 380 ++++++++++++++++++++
>  4 files changed, 395 insertions(+)
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc976938c58c..82b32e14581f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15348,6 +15348,7 @@ F:      Documentation/devicetree/bindings/dma/loo=
ngson,ls2k0300-dmamux.yaml
>  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:     drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:     drivers/dma/loongson/loongson2-apb-dma.c
> +F:     drivers/dma/loongson/loongson2-apb-dmamux.c
>  F:     include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>  LOONGSON LS2X I2C DRIVER
> diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfig
> index c4e62dce5d4f..18edf06ef64e 100644
> --- a/drivers/dma/loongson/Kconfig
> +++ b/drivers/dma/loongson/Kconfig
> @@ -38,4 +38,17 @@ config LOONGSON2_APB_CMC_DMA
>           which has 4/8 channels internally, enabling bidirectional data =
transfer
>           between devices and memory.
>
> +config LOONGSON2_APB_DMAMUX
> +       tristate "Loongson2 APB DMA Router (dmamux) support"
> +       depends on LOONGSON2_APB_CMC_DMA
If LOONGSON2_APB_DMAMUX is bound to LOONGSON2_APB_CMC_DMA (currently
it is true but I'm not sure in future), just use LOONGSON2_APB_CMC_DMA
in Makefile to compile both loongson2-apb-cmc-dma.c and
loongson2-apb-dmamux.c.

Huacai

> +       help
> +         Support for the DMA Mux controller found on Loongson-2 SoCs.
> +
> +         On Loongson-2K0300, the DMA Mux routes peripheral DMA requests =
to
> +         one of the 8 physical channels of the on-chip CMC DMA controlle=
r
> +         by programming the CHIP_CTRL13/14/15 registers.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called loongson2-apb-dmamux.
> +
>  endif
> diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefil=
e
> index 48c19781e729..517826a003ac 100644
> --- a/drivers/dma/loongson/Makefile
> +++ b/drivers/dma/loongson/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
> +obj-$(CONFIG_LOONGSON2_APB_DMAMUX) +=3D loongson2-apb-dmamux.o
> diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/lo=
ongson/loongson2-apb-dmamux.c
> new file mode 100644
> index 000000000000..b6f1f4112d61
> --- /dev/null
> +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Loongson2 SoC APB DMA Mux Controller
> + *
> + * Copyright (C) 2026 Loongson Technology Corporation Limited
> + *
> + * Device tree bindings:
> + *
> + *   2K0300:
> + *     dma_mux: dma-mux@16000134 {
> + *             compatible =3D "loongson,ls2k0300-dmamux";
> + *             reg =3D <0x0 0x16000134 0x0 0xc>;
> + *             #dma-cells =3D <3>;
> + *             dma-masters =3D <&dma>;
> + *             dma-requests =3D <22>;
> + *     };
> + *
> + * DMA specifier: <request> <channel> <flags>
> + *   - request: peripheral request ID (LS2K0300_DMA_* or LS2K1000_DMA_*)
> + *   - channel: target physical DMA channel or controller index
> + *   - flags:   channel configuration flags forwarded to the parent DMA
> + *              controller
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/dmaengine.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> +
> +/* Loongson-2K0300 registers definitions */
> +#define LS2K0300_CHIP_CTRL13           0x00
> +#define LS2K0300_CHIP_CTRL14           0x04
> +#define LS2K0300_CHIP_CTRL15           0x08
> +
> +/* CHIP_CTRL13 bitfields */
> +#define CTRL13_UART0_DMA_MAP           GENMASK(17, 16)
> +#define CTRL13_UART1_DMA_MAP           GENMASK(19, 18)
> +#define CTRL13_UART2_DMA_MAP           GENMASK(21, 20)
> +#define CTRL13_UART3_DMA_MAP           GENMASK(23, 22)
> +#define CTRL13_UART4_DMA_MAP           GENMASK(25, 24)
> +#define CTRL13_UART5_DMA_MAP           GENMASK(27, 26)
> +#define CTRL13_UART6_DMA_MAP           GENMASK(29, 28)
> +#define CTRL13_UART7_DMA_MAP           GENMASK(31, 30)
> +
> +/* CHIP_CTRL14 bitfields */
> +#define CTRL14_UART8_DMA_MAP           GENMASK(1, 0)
> +#define CTRL14_UART9_DMA_MAP           GENMASK(3, 2)
> +#define CTRL14_I2C0_DMA_MAP            GENMASK(5, 4)
> +#define CTRL14_I2C1_DMA_MAP            GENMASK(7, 6)
> +#define CTRL14_I2C2_DMA_MAP            GENMASK(9, 8)
> +#define CTRL14_I2C3_DMA_MAP            GENMASK(11, 10)
> +#define CTRL14_SPI2_DMA_MAP            GENMASK(13, 12)
> +#define CTRL14_SPI3_DMA_MAP            GENMASK(15, 14)
> +#define CTRL14_I2S_DMA_MAP             GENMASK(17, 16)
> +#define CTRL14_ADC_DMA_MAP             GENMASK(20, 18)
> +#define CTRL14_CAN0_DMA_MAP            GENMASK(23, 21)
> +#define CTRL14_CAN1_DMA_MAP            GENMASK(26, 24)
> +#define CTRL14_CAN2_DMA_MAP            GENMASK(29, 27)
> +#define CTRL14_CAN3_DMA_MAP            GENMASK(31, 30)
> +
> +/* CHIP_CTRL15 bitfields */
> +#define CTRL15_CAN3_DMA_MAP_HI         BIT(0)
> +
> +#define LS2K0300_DMA_MAX_CHANNEL       7
> +
> +/**
> + * enum loongson2_dmamux_type - Type of the mapping field
> + * @LOONGSON_DMAMUX_PAIR: 2-bit field, value selects a channel pair
> + *                        (0/1, 2/3, 4/5, 6/7) =E2=80=94 used on 2K0300.
> + * @LOONGSON_DMAMUX_SINGLE: 3-bit field, value selects a single channel
> + *                          or controller index directly.
> + */
> +enum loongson2_dmamux_type {
> +       LOONGSON_DMAMUX_PAIR,
> +       LOONGSON_DMAMUX_SINGLE,
> +};
> +
> +/**
> + * struct loongson2_dmamux_map - DMA request to register bitfield mappin=
g
> + * @reg: Register offset from the controller base
> + * @mask: Bitfield mask within the register
> + * @shift: Starting bit position of the bitfield
> + * @type: Mapping type (pair or single)
> + * @high_reg: Optional extension register offset (0 if unused)
> + * @high_shift: Bit position in the extension register
> + */
> +struct loongson2_dmamux_map {
> +       u32 reg;
> +       u32 mask;
> +       u8 shift;
> +       enum loongson2_dmamux_type type;
> +       u32 high_reg;
> +       u8 high_shift;
> +};
> +
> +/**
> + * struct loongson2_dmamux_config - SoC-specific DMA mux configuration
> + * @maps: Pointer to the request mapping table
> + * @num_maps: Number of entries in @maps
> + * @max_channel: Highest valid channel/controller index
> + * @parent_args_count: Number of cells to write to dma_spec->args[]
> + *                     when forwarding to the parent xlate.
> + */
> +struct loongson2_dmamux_config {
> +       const struct loongson2_dmamux_map *maps;
> +       u32 num_maps;
> +       u32 max_channel;
> +       u32 parent_args_count;
> +};
> +
> +/**
> + * struct loongson2_dmamux - DMA mux controller state
> + * @dev: Back pointer to the platform device
> + * @base: I/O-mapped register base
> + * @lock: Protects register read-modify-write sequences
> + * @dma_np: The parent DMA controller device nodes
> + * @dma_router: Router structure passed to of_dma_router_register()
> + * @config: SoC-specific configuration
> + */
> +struct loongson2_dmamux {
> +       struct device *dev;
> +       void __iomem *base;
> +       struct mutex lock;      /* Protects register read-modify-write se=
quences */
> +       struct device_node *dma_np;
> +       struct dma_router dma_router;
> +       const struct loongson2_dmamux_config *config;
> +};
> +
> +/* Loongson-2K0300 mapping table */
> +static const struct loongson2_dmamux_map ls2k0300_dmamux_maps[] =3D {
> +       [LS2K0300_DMA_UART0] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART0_DMA=
_MAP, 16,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART1] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART1_DMA=
_MAP, 18,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART2] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART2_DMA=
_MAP, 20,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART3] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART3_DMA=
_MAP, 22,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART4] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART4_DMA=
_MAP, 24,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART5] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART5_DMA=
_MAP, 26,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART6] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART6_DMA=
_MAP, 28,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART7] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART7_DMA=
_MAP, 30,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART8] =3D { LS2K0300_CHIP_CTRL14, CTRL14_UART8_DMA=
_MAP,  0,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_UART9] =3D { LS2K0300_CHIP_CTRL14, CTRL14_UART9_DMA=
_MAP,  2,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_I2C0]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C0_DMA_=
MAP,   4,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_I2C1]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C1_DMA_=
MAP,   6,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_I2C2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C2_DMA_=
MAP,   8,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_I2C3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C3_DMA_=
MAP,  10,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_SPI2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_SPI2_DMA_=
MAP,  12,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_SPI3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_SPI3_DMA_=
MAP,  14,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_I2S]   =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2S_DMA_M=
AP,   16,
> +                                LOONGSON_DMAMUX_PAIR,   0, 0 },
> +       [LS2K0300_DMA_ADC]   =3D { LS2K0300_CHIP_CTRL14, CTRL14_ADC_DMA_M=
AP,   18,
> +                                LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +       [LS2K0300_DMA_CAN0]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN0_DMA_=
MAP,  21,
> +                                LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +       [LS2K0300_DMA_CAN1]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN1_DMA_=
MAP,  24,
> +                                LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +       [LS2K0300_DMA_CAN2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN2_DMA_=
MAP,  27,
> +                                LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +       [LS2K0300_DMA_CAN3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN3_DMA_=
MAP,  30,
> +                                LOONGSON_DMAMUX_SINGLE, LS2K0300_CHIP_CT=
RL15, 0 },
> +};
> +
> +static const struct loongson2_dmamux_config ls2k0300_dmamux_config =3D {
> +       .maps                   =3D ls2k0300_dmamux_maps,
> +       .num_maps               =3D ARRAY_SIZE(ls2k0300_dmamux_maps),
> +       .max_channel            =3D LS2K0300_DMA_MAX_CHANNEL,
> +       .parent_args_count      =3D 2,
> +};
> +
> +static inline u32 loongson2_dmamux_read(struct loongson2_dmamux *mux, u3=
2 reg)
> +{
> +       return readl(mux->base + reg);
> +}
> +
> +static inline void loongson2_dmamux_write(struct loongson2_dmamux *mux, =
u32 reg, u32 val)
> +{
> +       writel(val, mux->base + reg);
> +}
> +
> +/**
> + * loongson2_dmamux_set_route() - Program the DMA request route
> + * @mux:     DMA mux controller
> + * @request: Peripheral DMA request ID
> + * @channel: Target physical DMA channel or controller index
> + *
> + * Computes the register value according to the mapping type:
> + *   - PAIR   : channel / 2 selects the pair index
> + *   - SINGLE : channel is written directly
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u32 =
request, u32 channel)
> +{
> +       const struct loongson2_dmamux_map *map;
> +       u32 reg_val, route_val, high_val =3D 0;
> +
> +       if (request >=3D mux->config->num_maps)
> +               return -EINVAL;
> +
> +       if (channel > mux->config->max_channel)
> +               return -EINVAL;
> +
> +       map =3D &mux->config->maps[request];
> +
> +       switch (map->type) {
> +       case LOONGSON_DMAMUX_PAIR:
> +               route_val =3D channel / 2;
> +               break;
> +       case LOONGSON_DMAMUX_SINGLE:
> +               route_val =3D channel;
> +               if (map->high_reg)
> +                       high_val =3D (channel >> 2) & 0x1;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       mutex_lock(&mux->lock);
> +
> +       /* Write the primary register field */
> +       reg_val =3D loongson2_dmamux_read(mux, map->reg);
> +       reg_val &=3D ~map->mask;
> +       reg_val |=3D field_prep(map->mask, route_val);
> +       loongson2_dmamux_write(mux, map->reg, reg_val);
> +
> +       /* Write the extension register field if present */
> +       if (map->high_reg) {
> +               reg_val =3D loongson2_dmamux_read(mux, map->high_reg);
> +               reg_val &=3D ~BIT(map->high_shift);
> +               reg_val |=3D high_val << map->high_shift;
> +               loongson2_dmamux_write(mux, map->high_reg, reg_val);
> +       }
> +
> +       mutex_unlock(&mux->lock);
> +
> +       return 0;
> +}
> +
> +/**
> + * loongson2_dmamux_route_allocate() - DMA router allocation callback
> + * @dma_spec: OF DMA specifier <request> <channel> <flags>
> + * @ofdma:    Router's of_dma structure; ofdma->dma_router points to our
> + *            struct dma_router embedded in struct loongson2_dmamux.
> + *
> + * Return: NULL as route_data (nothing to free), or an ERR_PTR on failur=
e.
> + */
> +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *dma=
_spec,
> +                                            struct of_dma *ofdma)
> +{
> +       struct loongson2_dmamux *mux;
> +       u32 request, channel, flags;
> +       int ret;
> +
> +       if (!ofdma->dma_router)
> +               return ERR_PTR(-EINVAL);
> +
> +       mux =3D container_of(ofdma->dma_router, struct loongson2_dmamux, =
dma_router);
> +
> +       if (dma_spec->args_count < 3)
> +               return ERR_PTR(-EINVAL);
> +
> +       request =3D dma_spec->args[0];
> +       channel =3D dma_spec->args[1];
> +       flags =3D dma_spec->args[2];
> +
> +       if (request >=3D mux->config->num_maps ||
> +           channel > mux->config->max_channel)
> +               return ERR_PTR(-EINVAL);
> +
> +       /* Program the SoC-specific route register */
> +       ret =3D loongson2_dmamux_set_route(mux, request, channel);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       /*
> +        * Rewrite dma_spec so the kernel router framework uses it to loo=
k
> +        * up the parent DMA controller and invoke its xlate.
> +        */
> +       dma_spec->np =3D mux->dma_np;
> +       dma_spec->args[0] =3D channel;
> +       dma_spec->args[1] =3D flags;
> +       dma_spec->args_count =3D mux->config->parent_args_count;
> +
> +       return NULL;
> +}
> +
> +static int loongson2_dmamux_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct loongson2_dmamux *mux;
> +       int ret;
> +
> +       mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> +       if (!mux)
> +               return -ENOMEM;
> +
> +       mux->dev =3D dev;
> +       mux->config =3D &ls2k0300_dmamux_config;
> +       mutex_init(&mux->lock);
> +
> +       mux->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(mux->base))
> +               return PTR_ERR(mux->base);
> +
> +       /* Parse parent DMA controller nodes */
> +       mux->dma_np =3D of_parse_phandle(dev->of_node, "dma-masters", 0);
> +       if (!mux->dma_np)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to find parent DMA controlle=
r\n");
> +
> +       mux->dma_router.dev =3D dev;
> +       mux->dma_router.route_free =3D NULL;
> +
> +       platform_set_drvdata(pdev, mux);
> +
> +       ret =3D of_dma_router_register(dev->of_node, loongson2_dmamux_rou=
te_allocate,
> +                                    &mux->dma_router);
> +       if (ret) {
> +               of_node_put(mux->dma_np);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register DMA router\n");
> +       }
> +
> +       dev_info(dev,
> +                "Loongson2 DMA Mux Controller registered (max_channel=3D=
%u, requests=3D%u)\n",
> +                mux->config->max_channel, mux->config->num_maps);
> +
> +       return 0;
> +}
> +
> +static void loongson2_dmamux_remove(struct platform_device *pdev)
> +{
> +       struct loongson2_dmamux *mux =3D platform_get_drvdata(pdev);
> +
> +       of_dma_controller_free(pdev->dev.of_node);
> +       of_node_put(mux->dma_np);
> +}
> +
> +static const struct of_device_id loongson2_dmamux_of_match[] =3D {
> +       { .compatible =3D "loongson,ls2k0300-dmamux" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
> +
> +static struct platform_driver loongson2_dmamux_driver =3D {
> +       .driver =3D {
> +               .name =3D "loongson2-dmamux",
> +               .of_match_table =3D loongson2_dmamux_of_match,
> +       },
> +       .probe =3D loongson2_dmamux_probe,
> +       .remove =3D loongson2_dmamux_remove,
> +};
> +module_platform_driver(loongson2_dmamux_driver);
> +
> +MODULE_DESCRIPTION("Loongson SoC DMA Mux Controller driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> --
> 2.52.0
>
