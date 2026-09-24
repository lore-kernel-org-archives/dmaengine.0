Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CF30DEA3
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242109; cv=none; b=Lf7hG7f8Uj/U0Z7aN3Y0IBpcEDMJUAIiqosHJ9qFAb3aQe6vUhW5O0efb9zxkwtHiZ/lCn55Zo2tD+7xmXQNZ5qrE2W7DnNq4svSvAYiXAVRQMh3Wi1y3+rn0nTrT+5jiVq2ieq8rSePtGIKAhuBIQ029x/nwpOb3I038eOxO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242109; c=relaxed/simple;
	bh=hH91/4fpDvehcCEHq2HC9eahllPD+H3Xl/BuFId23Gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iI1v/6RGFv7bNEjS4xACKLoEB6gQ/EiiPfZw+KWOJINSI8zNM/Bq4u2lpHO2k5nBVkyh7z83b/qVUl4y8ocq4ReErVlyHj79Bitm7AK6fjuWR4hxgZmAjzE5DOCOnuUaVIDPKu/mwk7RoL6GJInynDiGHzjeCqWz5LHrxwqfeZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOOOi1rz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOOOi1rz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3E71F000FF;
	Thu, 24 Sep 2026 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790242108;
	bh=hFsrqAGOkWO44HE10W9GcXAdvusz5UBYmgJHKJVD1fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aOOOi1rz2DWGNUpnqkP6JNDqeqI1O6hUnScAeGNMxj2+6P9L3SFMvaz3Z9Wv/vsZ7
	 cNYVE3QkeaaX0A/YarvmHj9l4Em6lw+Qy/bWbecGA2islhEo9H6wyn5kCzbwS+KuiG
	 g1JuXDneIO/Q8o3iWx9EsobV7/6j4GorlN5cQDd8n49Ygg4vqP9kToCXLLecQ3FshJ
	 Nw1ldObcK8OQ1OAMjmq0FKeUSQzxZpaEiR0YJq/lrUPATmHy8HKTV/zDMDy38Y+rdK
	 jpcCVp+Twj1lhMMzV0ti1lmLavApa35cG+RXqdgDS6Zz78ZxYFLYla4WN/HEbjmYb9
	 OHeTp0z85AaSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 20/23] dmaengine: ste_dma40: Fix event group bounds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260924-dma40-fixes-v6-20-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-20-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 09:28:27 +0000
Message-Id: <20260924092827.AC3E71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: channel aliasing for event group 4 on V4B
--

commit 48ff5fdacb29b6847b9d51f8ce427281645c1c9b
Author: Linus Walleij <linusw@kernel.org>
dmaengine: ste_dma40: Fix event group bounds

This commit fixes event group bounds validation by properly restricting
device type values to the hardware event-group range and removing incorrect
physical channel limits. It also stops physical channel searches before they
can index past the allocated channel array.

Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 8b13f1360edbe..d3d79e394d028 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -2068,8 +2078,12 @@ static int d40_allocate_channel(struct d40_chan *d=
40c, bool *first_phy_user)
>  				}
>  			}
>  		} else
> -			for (j =3D 0; j < d40c->base->num_phy_chans; j +=3D 8) {
> +			for (j =3D 0; j < d40c->base->num_phy_chans;
> +			     j +=3D D40_GROUP_SIZE) {
>  				int phy_num =3D j  + event_group * 2;
> +				if (phy_num + 1 >=3D num_phy_chans)
> +					break;
> +

[Severity: High]
Does this cause channel aliasing for event group 4 on V4B hardware?

Since D40_GROUP_SIZE is hardcoded to 8, if event_group is 4 (allowed for V4=
B)
and j is 0, phy_num evaluates to 8. But if event_group is 0 and j is 8,
phy_num also evaluates to 8.

Could this collision map two different groups to the same physical channel?

Additionally, since D40_PHYS_TO_GROUP is hardcoded as ((phys & 7) / 2),
channel 8 evaluates to group 0. Might this incorrectly configure the GCC cl=
ock
and hardware registers for group 0 instead of 4, breaking DMA operations for
event group 4 and channels >=3D 8?

[ ... ]
> @@ -2089,8 +2103,10 @@ static int d40_allocate_channel(struct d40_chan *d=
40c, bool *first_phy_user)
>  		return -EINVAL;
> =20
>  	/* Find logical channel */
> -	for (j =3D 0; j < d40c->base->num_phy_chans; j +=3D 8) {
> +	for (j =3D 0; j < d40c->base->num_phy_chans; j +=3D D40_GROUP_SIZE) {
>  		int phy_num =3D j + event_group * 2;
> +		if (phy_num + 1 >=3D num_phy_chans)
> +			break;

[Severity: High]
Will this mathematical collision also occur here for logical channel alloca=
tion
when event_group is 4?

[ ... ]
> @@ -3470,6 +3486,7 @@ static int __init d40_hw_detect_init(struct platfor=
m_device *pdev,
>  	base->log_chans =3D &base->phy_chans[num_phy_chans];
> =20
>  	if (base->plat_data->num_of_phy_chans =3D=3D 14) {
> +		base->gen_dmac.num_event_groups =3D D40_EVENT_GROUPS_V4B;

[Severity: High]
Does setting the max event groups to 5 allow event_group =3D 4, which
ultimately exposes the aliasing bug against the hardcoded block size of 8
in d40_allocate_channel()?

>  		base->gen_dmac.backup =3D d40_backup_regs_v4b;
>  		base->gen_dmac.backup_size =3D BACKUP_REGS_SZ_V4B;
>  		base->gen_dmac.interrupt_en =3D D40_DREG_CPCMIS;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-dma40-fixe=
s-v6-0-fdb6755020a2@kernel.org?part=3D20
