Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2E3603C3
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783774; cv=none; b=s5tIErqHxsNqk1rtb4szY64B/i3Ovtt5vmm0Iml3o58dJ2vWAm/uCoTAXnvDQ+TDzwOV1f2Tvj8v1g3b7oBVJnG8bH5FCf4GnTqk++ynAOmuvAFtY1AGswqsmMLICVm84hdGAJcEKy+r0O2TxZsF6pJBovmb0n1vHGqDj95J19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783774; c=relaxed/simple;
	bh=7PWfKB2PMpK10kT4VAL/8ETIRQRvk9c7jRpoqen6qYM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vh/L4FzPmHgjXkwszF2OxY6f7bsGrNYaw7C8CLhMAcXsvGRW7EsGIiMcyrXFcQkFYnXXSnfa3Lnj+QVAlU8NIVoww+RHO7AUizjJkBg71XZ4XXH+xnqvIyFVYHKIKWNtkB2YCtZWCyS5ruyRmFHGsHaAKXEgCba/HY7eL5Ijwxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/UAQhaC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/UAQhaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01571F000E9;
	Thu, 23 Jul 2026 05:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784783773;
	bh=LRNWQo56Se0yQkVjpY/jXKajw/pPA7yhiqiUkfGBMs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/UAQhaClrLClbFHY+r2woFedg2FYi34DhD6F06PPBSuqRtGgYv7VBvGySCaHE8b2
	 BssGV0Du2Ux9b4jcArlLKSegoqz+6nL9ctUbMyQ1Od14GZNMZhu4lBpe6X8DhSPrBN
	 ktFOrc6zgQx8HMCy3oFwbqW+qJbGCWta7h6pEvdjt8UvL+IP3uHuzgnMHdM28kSZGk
	 1YB67ecXxVdZDVvdSEdr3MglNwUOjc/grOKHqE0RCqug1zkQsadJYd6hiw43Lmx0md
	 8U/QdN8T7ENwFH3tQT6uJZ4vOgSivrUNshLyiE3/LCdXHzBwyU4LFPAkAVXnAtn9Zx
	 9PCiy1BpUKvNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: at_hdmac: fix memory leak in
 atc_prep_slave_sg
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260723050402.272606-1-rosenp@gmail.com>
References: <20260723050402.272606-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 05:16:12 +0000
Message-Id: <20260723051612.E01571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] NULL Pointer Dereference in atdma_desc_free during descriptor prep=
aration error paths.
--

--- Patch [1]: [PATCH] dmaengine: at_hdmac: fix memory leak in atc_prep_sla=
ve_sg ---
commit 59e07e1618be88a67e6deaa08218ec2ae653a007
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: at_hdmac: fix memory leak in atc_prep_slave_sg

This commit fixes a memory leak in the default switch case of the slave
scatter-gather preparation function. It adds a missing free for the
allocated descriptor before returning on an invalid direction.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..7763a94d3f998 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1381,6 +1381,7 @@ atc_prep_slave_sg(struct dma_chan *chan, struct sca=
tterlist *sgl,
>  		}
>  		break;
>  	default:
> +		kfree(desc);
>  		return NULL;
>  	}

[Severity: High]
This is a pre-existing issue, but while reviewing this error handling I not=
iced
a potential NULL pointer dereference in the other error paths of this funct=
ion.

If dma_pool_alloc() fails or an SG list has a zero-length entry, the code
jumps to the error path:

err_desc_get:
        dev_err(chan2dev(chan), "not enough descriptors available\n");
err:
        atdma_desc_free(&desc->vd);
        return NULL;

Inside atdma_desc_free(), it immediately evaluates the device from the chan=
nel:

static void atdma_desc_free(struct virt_dma_desc *vd)
{
        struct at_dma *atdma =3D to_at_dma(vd->tx.chan->device);
        ...
}

Since desc was just allocated with kzalloc_flex() which zeroes memory, and
vd->tx.chan is not initialized until vchan_tx_prep() is called at the end of
atc_prep_slave_sg(), won't vd->tx.chan still be NULL during this cleanup?

Does this code trigger a panic when attempting to dereference the NULL chan=
nel
pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050402.2726=
06-1-rosenp@gmail.com?part=3D1
