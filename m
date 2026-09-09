Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474A531B17;
	Wed,  9 Sep 2026 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950756; cv=none; b=CEKi5owloh7vxZVOa+lPFRTe5rqPY/0JZbXeWUwz5v/h03eBwDr7MItIq0AxADVcCQ+mcO3cIOjk/4wSOjDgFxWoIs6JGiyD9tynLNV0rb43QbUt5sJjxDcdBI+HMy2m5DabgWgvayx2qM3BrfSM9xu8pdyUgayY7xqfnjwL+Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950756; c=relaxed/simple;
	bh=zU/6Na4dqA0J2BYOCLRIkJqexaaO4GxOSZKrPedaYjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiE53GZxp8gOTu6h2ooDP2VpgJyC79EXPPd8l49Ke/xKlEeHmOpBIkGiF+FSEup1nTF39ndmRtLxkKlJEU4EogiolE2cmbcQ1T5ZCuC0ivJPWLjazX6jnq4OkTiz7RxUw4l+wAPAxO3t4V5Y5UibCIdRIg6H+lSNS9skPkQnxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIkjTtUO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIkjTtUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016461F00A3A;
	Wed,  9 Sep 2026 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788950754;
	bh=zU/6Na4dqA0J2BYOCLRIkJqexaaO4GxOSZKrPedaYjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hIkjTtUO5cFe3pq3/3ludV47z1AdJSEyKwsTrj4d+cY669joSijwpJsaNSE/ONJTh
	 C+MoAhZmn2dceL8rxbzoNw4pbmFOZx9UmxiRM6+EUQifV+57wWqxfbPDiro9+fty8k
	 7uwjbtvdWfxEZflWsxJc+uor9byX8RlATyZa0tTh+E35jcRMdhFFvoXPawl5zqvYH2
	 JSciQvP3+DGEuTpKp8MJYY6u48f+hP85JJhr1hhSIg8zPhi3fqo6TSt632CCQWUM8r
	 Jt+Tm/t8ymVHtsD21LpcLyfW4CprpZ9XJj32QpBfEqtL9z1/Eb3WmDKeboygFxVIN7
	 1bzEOShfKSPVQ==
Date: Wed, 9 Sep 2026 11:45:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Message-ID: <aqE42NzerAiD2U1E@squawk>
References: <20260907-retorted-unfasten-e985a6d4f26f@spud>
 <20260909060512.3524983-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iS2/TDiTYr3NoP2p"
Content-Disposition: inline
In-Reply-To: <20260909060512.3524983-1-Jelly.Jia@cixtech.com>

--iS2/TDiTYr3NoP2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 02:05:12PM +0800, Jelly Jia wrote:
> Hi Conor,
>=20
> Thanks for the review.
>=20
> > I cannot really speak to whether this is a correct thing to do with a
> > dma-350, but it seems to me like something that should be resolved with
> > a device specific comaptible in the dma-350 node. Someone more familar
> > with the IP will have to comment on that.
>=20
> The wrapper is there to keep the platform integration bits (clocks,
> resets, interrupt routing) out of the generic driver: the arm-dma-350
> child stays plain so the existing driver binds to it unchanged. I don't
> know whether other dma350 integrations need the same resources, so I
> did not want to push them into the generic node.

Don't worry about this, given the limited extent of the wrapper driver,
at worst you will end up with a different probe function. The specific
compatible that you'll use will prevent the code relating to these
resources running on other platforms.

Thanks,
Conor.

>=20
> > However I would like to know how this impacts the existing dma-350 in he
> > sky1 devicetree.
>=20
> Patch 5 converts the existing FCH node to this form: the register window
> and the eight GIC interrupts are unchanged, the arm-dma-350 controller
> becomes the dma-controller@0 child, and the SCMI clock feeding the
> instance is added. The AUDSS instance is new. I'll describe this
> conversion in the patch 5 commit message in v2.
>=20
> Best regards,
> Jelly

--iS2/TDiTYr3NoP2p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqE42AAKCRB4tDGHoIJi
0mo0AP4kPtLTFrpjSRLG2RYgU/IfafjOKjTpdvgvhwgA249n0AD/TYV6bJ1cMdC8
IDbJBAKvwxNQmda76KdU7osiKS364Q4=
=o2Gy
-----END PGP SIGNATURE-----

--iS2/TDiTYr3NoP2p--
