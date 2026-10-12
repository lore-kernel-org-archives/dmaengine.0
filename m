Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C751FC0
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 21:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842317; cv=none; b=gwHy/JwpDFkQqZ8aLix9LDYNIhLTFJ+KvbUoDtJEjf/VCLHkBOGg9KyokkeU0x3JgXKPa4+1mryFHZv0es71AguiZjfnrLDFNSKSDBqgnhJLbBv6R0Z7pjTKZKhP8OHuSaPwk6HbfaoLGsOkw5JvcDenAdTAzZ+Wp9DkzEg1ezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842317; c=relaxed/simple;
	bh=87S6eVGuQKBvpwtHJkUTd0IsDKbY1B9kTdeaNzfu/FM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mZh5gGCfVP0bou11efapzz0K6MeEqH8/wn/ATaa/fOU8aLZS9uWsHJE6NsUOTHFgxzS8NPPDJ9ZamIpUBqfQkCK2pawSBwgbbdUiJbcNUKiSZmmP2aOVwMBZ1ep+RUt8HAAo0ZA5I8O7kLyoYl3/FeXiCdWCEAWzZvYPfR9wYOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4uUXN0M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4uUXN0M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D209E1F0089B;
	Mon, 12 Oct 2026 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791842316;
	bh=XFgJ4ZskBaclh5GqZDvycHSX/yGrVqhyHJkcWvS9yEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4uUXN0MNo2fqTWJCmdS63mdUBzLXzxtpphqPCVI9nTZxmb0eYHaEiLTTH8Ibvymi
	 D+rX+KJWtBxYmZtXQemHbTKfq2NcMvsKXBjCBeMuvPmAM3PM4zQLtHjHcve3T2X62U
	 RzNA03WiCzixpHQbVKykbfasoqhiFUmBMZ/ihwWC2kIlupQCvLPo9mluhtQfbRRPNo
	 rPIzcCJGWolU+tDCJDYsJWKMqhSszThV1/lsXC8qTu5Lnnqmfdjh63aq6VJJR0d7dv
	 FMsYcUwINwdAo8KNnjQ74yCoeMYZ5LWuHPWd/etpapsciZmLXdTVloxsJ+NyY+8KPw
	 YRZnvevmtu7Zg==
Message-ID: <sashiko-outbox-168653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] dmaengine: idxd: Do not release interrupt handles
 on terminate_all
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261012-wt-idxd-fixes-v1-6-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-6-30a35a445077@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 21:58:35 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dma: idxd: sleep in atomic context in device_terminate_all()
- [High] dmaengine: idxd: Hardware UAF and IOMMU faults due to flushing act=
ive WQ without disable
- [Medium] dmaengine: idxd: missing check for INVALID_INT_HANDLE in release
--

commit dc7ea0d446f4b8c4e4f29fa4595acabcca6b297f
Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>

dmaengine: idxd: Do not release interrupt handles on terminate_all

This commit splits the interrupt handle teardown from the descriptor
flushing in idxd_wq_flush_descs(). This prevents the interrupt handle
from being incorrectly released during dmaengine terminate_all, which
was causing subsequent runs to time out.

> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index 131138483b877..06299f40f5312 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c
> @@ -1349,6 +1349,16 @@ void idxd_wq_free_irq(struct idxd_wq *wq)
>  }
> =20
>  void idxd_wq_flush_descs(struct idxd_wq *wq)
> +{
> +	guard(mutex)(&wq->wq_lock);
> +
> +	if (wq->state !=3D IDXD_WQ_ENABLED || wq->type !=3D IDXD_WQT_KERNEL)
> +		return;
> +
> +	idxd_flush_pending_descs(&wq->ie);
> +}

[Severity: High]
Does this code introduce a sleep-in-atomic bug when called via the
dmaengine termination path?

The dmaengine API allows dmaengine_terminate_async() to be called from
atomic context (such as an interrupt handler or while holding a spinlock).

This routes to idxd_dma_terminate_all(), which then calls
idxd_wq_flush_descs().

Because idxd_wq_flush_descs() unconditionally acquires wq->wq_lock using
a sleepable mutex, terminating an asynchronous transfer from atomic
context could trigger a scheduling-while-atomic panic.

[Severity: High]
Can this flush implementation cause a use-after-free and IOMMU faults?

By calling idxd_flush_pending_descs() without first disabling or halting
the hardware workqueue, the software descriptors are completed, freed,
and client memory is unmapped while the hardware may still be actively
processing them.

Since the hardware continues to execute DMA operations into buffers that
have already been unmapped, can this result in memory corruption and
IOMMU faults?

> +
> +void idxd_wq_release_int_handle(struct idxd_wq *wq)
>  {
>  	struct idxd_irq_entry *ie =3D &wq->ie;
>  	struct idxd_device *idxd =3D wq->idxd;
> @@ -1358,7 +1368,6 @@ void idxd_wq_flush_descs(struct idxd_wq *wq)
>  	if (wq->state !=3D IDXD_WQ_ENABLED || wq->type !=3D IDXD_WQT_KERNEL)
>  		return;
> =20
> -	idxd_flush_pending_descs(ie);
>  	if (idxd->request_int_handles)
>  		idxd_device_release_int_handle(idxd, ie->int_handle, IDXD_IRQ_MSIX);

[Severity: Medium]
Is it possible for ie->int_handle to be INVALID_INT_HANDLE here?

If a previous operation leaves the handle as INVALID_INT_HANDLE (-1) but
the workqueue remains in the IDXD_WQ_ENABLED state, this code will
unconditionally issue a release command to the hardware using -1 (0xffff).

Should this function include a check for ie->int_handle =3D=3D
INVALID_INT_HANDLE before calling idxd_device_release_int_handle(),
similar to how it is handled in idxd_wq_free_irq()?

>  	idxd_device_clear_perm_entry(idxd, ie);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-wt-idxd-fi=
xes-v1-0-30a35a445077@intel.com?part=3D6
