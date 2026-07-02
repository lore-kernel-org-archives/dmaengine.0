Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B14381EBB;
	Thu,  2 Jul 2026 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005936; cv=none; b=BVTHv3iJ2iCBXD4GAazQisyxrJQn0MqNYNQY7mD3a4IDBYeyDV2OKUfhR5NQe+Wq6vHhoecPcT2pmy8EDDabxKiOuxoesXz8BmG3x2VWqo2/gpXONPFm+cKdPm7UZPnjUfCGB69mtG+2ildzwBOMMP97MNLvUlRK5rSVvhCN7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005936; c=relaxed/simple;
	bh=9ASYut8spl8Qh5bkDmz43zcuqk6gnLCBKl9uOQJUUlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IpkUdANj44Pc5ZEgBuhdQxLyPquTvZvTjYOcaHUe+e2FwCDqJ6ax8wlR0ofLA3LQo/xTk+Skjd2QMZdEFCoUrS+P2Vl8Bm81RB2muz+MeKcvy1CkLwi0BZPZ1MNj8O/uaitjKA/mCba3z3eGyrtSjkVrPy7mfYkHg1oU0F0tSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+PA7oFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+PA7oFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AAA1F000E9;
	Thu,  2 Jul 2026 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005935;
	bh=MQ3Zpmn1pEDWxOx53vrT67yC5ECrhggWbRLJkRY00HE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U+PA7oFs+IkYnmoxk+J/iLXdAMHlMXEsW4Gd92G91MPLp5V12xocqub70AzVtss1M
	 aS0AgTQfcUI5AWkuW4rcdG8j0pZS0paIo/c+J1SWVlrfxLDCCRYwo7ajp2iTzjFjD1
	 Qbh0oLq8qwTsYOFDpoPoFyMPLSJ55GiriAp8c2AS97vpzuR9VYXNNNY+hEGIFoLC+6
	 wOAl8UeIiX5p5YgFqJLJs7hzjXsszx9m9HleK3jycgfbOtTDuV9dGihGpm2LeHg+ZI
	 1LPI1rVwUHOMM8V48LlxeVIcvAmicUHIAm55uRt53oZG6IlsEJLgZpYjkt0cu5kekD
	 Tlf+4CzVl4sug==
From: Vinod Koul <vkoul@kernel.org>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Yuho Choi <dbgh9129@gmail.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525141550.1385581-1-dbgh9129@gmail.com>
References: <20260525141550.1385581-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v3] dmaengine: idxd: fix fdev setup failure cleanup in
 idxd_cdev_open()
Message-Id: <178300593357.726714.5435920347978099252.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 20:55:33 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 25 May 2026 10:15:50 -0400, Yuho Choi wrote:
> The failed_dev_add and failed_dev_name paths drop the file-device
> reference while wq->wq_lock is still held. If put_device(fdev) drops the
> last reference, idxd_file_dev_release() runs synchronously and tries to
> take wq->wq_lock again, deadlocking.
> 
> Those paths also fall through into the later ctx cleanup labels even
> though idxd_file_dev_release() owns that cleanup and frees ctx. This can
> make idxd_xa_pasid_remove(ctx) and kfree(ctx) operate on a freed context.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: idxd: fix fdev setup failure cleanup in idxd_cdev_open()
      commit: ee1d7274102285d78a53161fc705a8d8cd40b066

Best regards,
-- 
~Vinod


