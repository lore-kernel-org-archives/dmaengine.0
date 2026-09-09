Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD393C4B79;
	Wed,  9 Sep 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983485; cv=none; b=BNNLIDhPMbmd9m1QYB1ZqB6bZnT2r/xwRLKPKBOqHkchkXHzNW67TRDsYTDO/mr1t/wrQb69IV6AoaB1lOYRUKN/hzvBm1eneDJV2aoDYNNk7DCNrQ3YLr+rZXedubTW7MbIIaX4DVTJkCIyNeWTnoiFutljlG3Rx9+s6ewCdio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983485; c=relaxed/simple;
	bh=gmfOVMX1I/rGiaf52C4lJ6cReeMhGmhaT8KPruLFtok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tkpTJ2AUFF9+OroD/re2PZwaVwtBU1GWyWbIYvh52gbIwFpQMh/4oJboqO5D83xPSZI/ME0d24xQpNIwt8xDJ1bh1MJVPEY3CHZK2kDNCeavatrT7Vgz4ixhsctu+ZUHTG7U6lp/tyrFgbirfIF01TIyZAc1gs9Xlgd7y4hBXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4TkZPnr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4TkZPnr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23681F000FF;
	Wed,  9 Sep 2026 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788983483;
	bh=x1baN3/KiJ0Pcxtno8iZmTlaZnsqRiTIsZXJ07kdsBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4TkZPnrI0XCGXZORPkH6/I4VOKCqSFAe7RsdCEltzLght10T132KHs0I4fPoQXGg
	 LVoIklqdT+CR1CfEOqytokoE7DJPrLYSW2fR6hZKSfr0zL48aVABiTe3JlNU1wPtGD
	 3im/af5ibZTKotd97g2IOdCnxARO6PDpbxF5vMrAWulGDm/YHTQxyEfd8118t/W78a
	 OjrKLzbTp2zxUrJo3DvA8e5Oedz1AWP4DO32zDOl22SqID4wM4tFbIsJ706EViGmYS
	 eAxn+o0qWa7m4flLXonMpjmHRlCwXIrlWiNDLiKn2f2Z4YrRmjHnjOPJOMTHYJiejT
	 3C/tkw29YWjvQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] soc: renesas: rz-sysc: Configure AOF registers
 from dma-ranges
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260909193640.8069-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260909193640.8069-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 19:51:22 +0000
Message-Id: <20260909195122.E23681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] The driver incorrectly uses the parent's `#address-cells` and `#si=
ze-cells` to parse all fields of the `dma-ranges` property, which fails if =
the child and parent buses have different cell sizes.
- [High] An integer overflow in the `cell_sz` calculation allows a maliciou=
sly crafted Device Tree to bypass property length checks, resulting in a ma=
ssive out-of-bounds read.
- [Medium] `rz_sysc_setup_aof()` globally traverses all `simple-bus` nodes =
with a `dma-ranges` property in the system, emitting warnings for unrelated=
 buses.
- [Medium] The target physical address validation silently truncates addres=
ses that exceed the maximum addressable width instead of returning an error.
- [Medium] An empty `dma-ranges` property incorrectly programs all hardware=
 windows to physical address 0 instead of establishing a 1:1 mapping.
- [Medium] The check to ensure the described child range does not exceed th=
e master's 4 GiB address space is completely bypassed because bits above 4 =
GiB are masked out before validation.

Pre-existing issues:
- [High] Missing `soc_device_unregister()` for the SoC device created in `r=
z_sysc_soc_init()`. If `rz_sysc_probe()` fails, devres cleans up `soc_dev_a=
ttr` leading to a Use-After-Free when sysfs is accessed, and the `soc_devic=
e` is permanently leaked.
--

commit dfb512e475d4fea533f55a96af47e3ef4b23f122
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

soc: renesas: rz-sysc: Configure AOF registers from dma-ranges

This patch adds generic infrastructure to configure the Address Offset Func=
tion
(AOF) registers from the firmware-provided dma-ranges property. It sets up
memory windows for masters that generate 32-bit addresses but need to access
memory above the 4 GiB boundary. The appropriate SYS_AOF registers are
programmed by parsing and validating the dma-ranges.

> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
> index 0e92c415d4bef..2dae4a0de99bc 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
[ ... ]
> @@ -28,6 +29,121 @@ struct rz_sysc {
>  	struct device *dev;
>  };
> =20
[ ... ]
> +static int rz_aof_parse_bus(struct rz_sysc *sysc,
> +			    const struct rz_sysc_soc_id_init_data *soc_data,
> +			    struct device_node *bus_np)
> +{
[ ... ]
> +	naddr =3D of_n_addr_cells(bus_np);
> +	nsize =3D of_n_size_cells(bus_np);
> +	cell_sz =3D (naddr * 2 + nsize) * sizeof(u32);

[Severity: High]
Does this code fetch the wrong cell sizes? The standard dma-ranges format
requires the child address to be parsed using the child's address-cells,
which would be of_bus_n_addr_cells(bus_np). of_n_addr_cells(bus_np) and
of_n_size_cells(bus_np) fetch the parent's cell sizes, which corrupts the
subsequent property extraction if the child and parent have different sizes.

Also, is there an integer overflow risk here?=20

of_n_addr_cells() can return an unvalidated 32-bit integer directly from
the device tree. The cell_sz calculation uses a signed 32-bit integer for
naddr, and the result expands to a 64-bit unsigned size_t but is truncated
when assigned to the int cell_sz.=20

Could this truncation bypass property length checks later?

> +
> +	ranges =3D of_get_property(bus_np, "dma-ranges", &len);
> +	if (!ranges || !cell_sz || len % cell_sz) {
> +		dev_err(sysc->dev, "%pOF: malformed dma-ranges\n", bus_np);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Will this handle an empty dma-ranges property correctly?=20

An empty property is valid and indicates a 1:1 mapping, returning len =3D 0.
The validation len % cell_sz succeeds for 0, so the loop is skipped and
reg_val remains 0. Writing 0 configures all windows to point to physical
address 0, which breaks the 1:1 mapping.

> +	nentries =3D len / cell_sz;
> +
> +	for (i =3D 0; i < nentries; i++) {
> +		const __be32 *p =3D ranges + i * (naddr * 2 + nsize);
> +		u64 child_addr =3D of_read_number(p, naddr);
> +		u64 parent_addr =3D of_read_number(p + naddr, naddr);

[Severity: High]
Is it intentional to use the parent's naddr cell count to extract both the
child and parent addresses?=20

Additionally, if a massive unvalidated naddr bypassed the length check earl=
ier
due to overflow, won't of_read_number(p, naddr) cause a massive out-of-boun=
ds
read and kernel panic?

> +		u64 size =3D of_read_number(p + 2 * naddr, nsize);
> +		unsigned int nseg =3D DIV_ROUND_UP_ULL(size, SZ_1G);
> +		unsigned int sel0 =3D (child_addr >> 30) & 0x3;

[Severity: Medium]
Does this mask out bits above 4 GiB?=20

By using & 0x3, the overflow bits are discarded, so sel0 wraps around. This
completely bypasses the overflow check (if (sel > 3)) later in the loop,
causing invalid configurations to be silently applied to the wrong windows.

> +		u64 tgt0 =3D parent_addr >> 30;
> +		unsigned int s;
> +
> +		if (child_addr & (SZ_1G - 1) || parent_addr & (SZ_1G - 1)) {
> +			dev_err(sysc->dev, "%pOF: entry %d not 1GiB aligned\n", bus_np, i);
> +			return -EINVAL;
> +		}
> +
> +		for (s =3D 0; s < nseg; s++) {
> +			unsigned int sel =3D sel0 + s;
> +			u64 tgt =3D tgt0 + s;
> +
> +			if (sel > 3) {
> +				dev_err(sysc->dev, "%pOF: entry %d overflows the 4 fields\n",
> +					bus_np, i);
> +				return -EINVAL;
> +			}
> +			if (unit->addr_bits =3D=3D 35 && (tgt & BIT(5))) {
> +				dev_err(sysc->dev,
> +					"%pOF: target 0x%llx needs bit[5], unit is 35-bit only\n",
> +					bus_np, tgt << 30);
> +				return -EINVAL;
> +			}
> +			reg_val &=3D ~(0x3fu << (sel * 8));
> +			reg_val |=3D (tgt & 0x3f) << (sel * 8);

[Severity: Medium]
Does this silently truncate target addresses >=3D 64 GiB?=20

If parent_addr is >=3D 64 GiB (tgt >=3D 64), the 6th bit is set, meaning
tgt & BIT(5) is 0, bypassing the validation check entirely. The target is t=
hen
truncated to 6 bits by (tgt & 0x3f) << (sel * 8) instead of returning an er=
ror.

> +		}
> +	}
> +
> +	writel(reg_val, sysc->base + SYS_AOF_OFFSET(soc_data->aof_base, unit->i=
ndex));
> +
> +	return 0;
> +}
> +
> +static void rz_sysc_setup_aof(struct rz_sysc *sysc,
> +			      const struct rz_sysc_soc_id_init_data *soc_data)
> +{
> +	struct device_node *np;
> +
> +	if (!soc_data->aof_units || !soc_data->num_aof_units)
> +		return;
> +
> +	for_each_node_with_property(np, "dma-ranges") {
> +		if (!of_device_is_compatible(np, "simple-bus"))
> +			continue;
> +
> +		if (rz_aof_parse_bus(sysc, soc_data, np))
> +			dev_warn(sysc->dev, "AOF setup failed for %pOF\n", np);
> +	}
> +}

[Severity: Medium]
Does this loop emit false-positive warnings for unrelated buses?=20

Searching globally for any simple-bus with a dma-ranges property will match
valid buses that have nothing to do with AOF, causing rz_aof_lookup() to fa=
il
and spitting out warning logs.

[ ... ]
> @@ -137,6 +253,8 @@ static int rz_sysc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	rz_sysc_setup_aof(sysc, data->soc_id_init_data);
> +
>  	regmap_cfg->name =3D "rz_sysc_regs";
>  	regmap_cfg->reg_bits =3D 32;
>  	regmap_cfg->reg_stride =3D 4;

[Severity: High]
This is a pre-existing issue, but does rz_sysc_soc_init() leak the SoC devi=
ce
and cause a use-after-free?

rz_sysc_soc_init() registers an SoC device using soc_device_register() with=
 a
devres-managed soc_dev_attr structure, and discards the returned pointer.

If rz_sysc_probe() fails later (e.g., in devm_regmap_init_mmio()), devres
cleans up soc_dev_attr, leaving the registered soc_device with a dangling
pointer. Accessing sysfs for this device will then cause a use-after-free, =
and
the soc_device memory is leaked because soc_device_unregister() is never ca=
lled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909193640.8069=
-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
