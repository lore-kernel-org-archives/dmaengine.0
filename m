Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624AD34EF05
	for <dmaengine@vger.kernel.org>; Fri, 22 May 2026 22:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490267; cv=none; b=SvUTAwhe02ZYEvMxrqwoZVGz7qg9nJtmbyPAGQBEwmvBNN2FWQUKFUpKJzRoJwViNYfDkl8qw12Cn4kvK8o6PkWp8rrZUxrTtCybT7QXAtMC/JZhkPtEoGfXQeF8G/H6eo/jY9PA8tyInSacEXvqmrw7vqfhuBDmHLbOQTxtHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490267; c=relaxed/simple;
	bh=41AEb8Ylu6ZQTtPo+Peg4189qUuQ6gUpf9yzB98nklI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oJR9q/Q0O8tR8Lfv4VNNUzJd8k43zjjYpoTVyMtYPZIG8N3DoyvRd0EAyWPYooYTP2lab9T5qZDn64ltYXjEa9nEg+vChBMngnG1RH13X3NFF7Uh7cZVRD38wiUZz03jo1knXX5S9Gv0qi/LiaZK9PI3ULnA1kLekeBj66e4O8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHxh/Oow; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHxh/Oow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E7A1F000E9;
	Fri, 22 May 2026 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779490266;
	bh=8WHU8B7vLM1TSkptJmovd9IefgPffqCyT+IjJND8HWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHxh/OowaMcPQ13dXGV6gE0uX4WgSG7Z+h+KiT4wfuMj1jW4e747DO/NoJNmjS2NT
	 nyE4Dg3lsiCryyOoj5sytKrUCsS1E/IlncOQIE1MNza50mXw4NkNmAqJgzSeJMIt1/
	 WGdz1PR0Eq+szpeH940wfCmyc72gqZ5ErPpo12CV+IDtrYT9HlxJAKm4zi0UyC5PYi
	 5S3GSYc4jMnpzceb8ugEv6ejHJzTM6vv3e1tqCJySkAbeAmrSiuk65uMmj1hb9fve8
	 8c6zPpQjVTRmEQm8eRHJ3txIINefBty1j/KT+DJICQsmN7MgVUdoxVCQUne8hTcMmD
	 tSl2giNtE6d8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: idxd: fix duplicate memory frees on
 initialization error path.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steve Wahl" <steve.wahl@hpe.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260522203414.336549-2-steve.wahl@hpe.com>
References: <20260522203414.336549-2-steve.wahl@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 22:51:05 +0000
Message-Id: <20260522225105.D5E7A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double frees of child objects (workqueues, engines, groups) remain=
 unaddressed in their respective cleanup functions and setup error paths.
- [High] Dangling pointers left by `idxd_cleanup_internals()` result in a s=
econd wave of double frees when `idxd_conf_device_release()` is triggered.
--

commit 4ee711bb61961f88e9ddb1a67af212cce348ee26
Author: Steve Wahl <steve.wahl@hpe.com>

dmaengine: idxd: fix duplicate memory frees on initialization error path.

This commit removes duplicate memory frees in idxd_alloc() and idxd_free()
by relying on the device release callback triggered by put_device() to
handle the cleanup of the idxd structure and its internal allocations.

> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index f1cfc7790d950..227e323cc5a0b 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -607,9 +607,6 @@ static void idxd_free(struct idxd_device *idxd)
>  		return;
> =20
>  	put_device(idxd_confdev(idxd));

[Severity: High]
This is a pre-existing issue, but does idxd_cleanup_internals() leave
dangling pointers that could cause a second wave of double frees here?

During device initialization in idxd_probe(), if an error occurs after
idxd_setup_internals() succeeds (e.g., idxd_device_load_config() fails),
idxd_cleanup_internals() is called. This function explicitly frees
sub-allocations (idxd->wqs, idxd->engines, idxd->groups) and calls
destroy_workqueue(idxd->wq), but it doesn't set these pointers to NULL.

When the error propagates back to idxd_pci_probe_alloc(), it calls
idxd_free(), which reaches this put_device() call. This triggers the
idxd_conf_device_release() callback, which blindly attempts to free the
exact same dangling pointers again and calls destroy_workqueue(idxd->wq) a
second time.

> -	bitmap_free(idxd->opcap_bmap);
> -	ida_free(&idxd_ida, idxd->id);
> -	kfree(idxd);
>  }

[ ... ]

> @@ -649,8 +646,13 @@ static struct idxd_device *idxd_alloc(struct pci_dev=
 *pdev, struct idxd_driver_d
>  	return idxd;
> =20
>  err_name:
> +	/*
> +	 * once device_initialize(conf_dev) is called,
> +	 * put_device(conf_dev) will end up calling
> +	 * idxd_conf_device_release() which will free the rest.
> +	 */
>  	put_device(conf_dev);

[Severity: High]
This isn't a bug introduced by this patch, but are there similar duplicate
frees remaining for child objects like workqueues, engines, and groups?

While this patch correctly removes the duplicate frees for the main idxd
object, the exact same pattern appears to exist for child objects in functi=
ons
like idxd_setup_wqs(), idxd_setup_engines(), and idxd_setup_groups(), as we=
ll
as their cleanup counterparts.

In those functions, put_device(conf_dev) is called to drop the reference
count, which synchronously invokes the device's release callback (e.g.,
idxd_conf_wq_release()). The callback explicitly frees the inner members and
the object itself (kfree(wq)).

However, immediately after put_device() returns, the manual cleanup code
incorrectly calls kfree() and bitmap_free() on those exact same pointers
again. Could this lead to double frees during initialization failure or dev=
ice
removal?

> -	bitmap_free(idxd->opcap_bmap);
> +	return NULL;
>  err_opcap:
>  	ida_free(&idxd_ida, idxd->id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522203414.3365=
49-1-steve.wahl@hpe.com?part=3D2
